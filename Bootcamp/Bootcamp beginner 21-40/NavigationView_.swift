//
//  NavigationView_.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 13.02.2022.
//

import SwiftUI

struct NavigationView_: View {
    var body: some View {
        NavigationView {
            ScrollView {
                
                NavigationLink("Hello") {
                    MyOtherScreen()
                }
                
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
            .navigationTitle("Inbox")
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName: "person.fill")
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "gear")
                }
            }
    }
}
}

struct MyOtherScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
        Color.green
            .navigationBarHidden(true)
            
            Button("Back button") {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}



struct NavigationView__Previews: PreviewProvider {
    static var previews: some View {
        NavigationView_()
    }
}
