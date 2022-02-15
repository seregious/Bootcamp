//
//  TabView_.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 15.02.2022.
//

import SwiftUI

struct TabView_: View {
    
    @State var selectedTab : Int = 2
    
    var body: some View {
        TabView(selection: $selectedTab) {
            
            HomeView(selectedTab: $selectedTab)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("home")
                }
                .tag(0)
            
            Text("Browse tab")
                .tabItem {
                    Image(systemName: "globe")
                    Text("browse")
                }
                .tag(1)
            
            Text("Profile tab")
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("profile")
                }
                .tag(2)
        }
    }
}

struct TabView__Previews: PreviewProvider {
    static var previews: some View {
        otherTab()
        //TabView_()
    }
}

struct HomeView: View {
    
    @Binding var selectedTab : Int
    
    var body: some View {
        ZStack{
            Color.red
                .edgesIgnoringSafeArea(.top)
            
            VStack{
                Text("home tab")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                Button {
                    selectedTab = 2
                } label: {
                    Text("go to profile")
                        .font(.headline)
                        .padding()
                        .background(.white)
                        .cornerRadius(20)
                }
            }
        }
    }
}


struct otherTab : View {
    
    let icons = [
        "heart",
        "globe",
        "person",
        "house"
    ]
    
    var body: some View {
        TabView{
            ForEach(icons, id: \.self) {icon in
                Image(systemName: icon)
                    .resizable()
                    .scaledToFit()
                    .padding(30)
            }
        }
        .background(
            RadialGradient(colors: [.red, .blue], center: .center, startRadius: 1, endRadius: 300)
        )
        .frame(height: 300)
        .tabViewStyle(.page)
    }
}

















