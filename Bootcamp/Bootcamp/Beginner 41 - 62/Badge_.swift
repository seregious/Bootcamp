//
//  Badge_.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 17.02.2022.
//

import SwiftUI

struct Badge_: View {
    var body: some View {
        TabView {
                
                
            Color.red
            .tabItem {
                Image(systemName: "heart.fill")
                Text("Hello")
            }
            .badge(5)
            
            Color.blue
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Hello")
                }
                .badge("New")
            
            List{
                Text("1")
                    .badge("New Item")
                Text("1")
                Text("1")
                Text("1")
                Text("1")
            }
            .tabItem {
                Image(systemName: "heart.fill")
                Text("List")
            }
            .badge("List")
        }
    }
}

struct Badge__Previews: PreviewProvider {
    static var previews: some View {
        Badge_()
    }
}
