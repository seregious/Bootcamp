//
//  EnvironmentObject_.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 16.02.2022.
//

import SwiftUI

class EnvironmentViewModel : ObservableObject {
    
    @Published var dataArray: [String] = []
    
    init () {
        getData()
    }
    
    func getData() {
        self.dataArray.append(contentsOf: ["Iphone", "iPad", "iMac", "Apple Watch"])
    }
}

struct EnvironmentObject_: View {
    
    @StateObject var viewModel : EnvironmentViewModel = EnvironmentViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.dataArray, id: \.self) {item in
                    NavigationLink(
                        destination: {
                            DetailView(selectedItem: item)
                        }, label: {
                            Text(item)
                        })
                    
                }
            }
            .navigationTitle("iOS Devices")
        }
        .environmentObject(viewModel)
    }
}

struct DetailView : View {
    
    let selectedItem : String
    
    var body: some View {
        ZStack {
            Color.orange.ignoresSafeArea()
            
            NavigationLink {
                FinalView()
            } label: {
                Text(selectedItem)
                    .font(.headline)
                    .foregroundColor(.orange)
                    .padding()
                    .background(.white)
                    .cornerRadius(30)
            }

            
        }
    }
}


struct FinalView : View {
    
    @EnvironmentObject var viewModel : EnvironmentViewModel
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.teal, Color.blue], startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(viewModel.dataArray, id: \.self) {item in
                        Text(item)
                    }
                }
                .foregroundColor(.white)
                .font(.largeTitle)
            }
        }
    }
}



struct EnvironmentObject__Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentObject_()
        //DetailView(selectedItem: "iPhone")
    }
}





