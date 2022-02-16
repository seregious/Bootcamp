//
//  DarkMode_.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 15.02.2022.
//

import SwiftUI

struct DarkMode_: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    
                    Text("this text is primary")
                        .foregroundColor(.primary)
                    
                    Text("this text is secondary")
                        .foregroundColor(.secondary)
                    
                    Text("This text is black")
                        .foregroundColor(.black)
                    
                    Text("This text is white")
                        .foregroundColor(.white)
                    
                    Text("This text is red")
                        .foregroundColor(.red)
                    
                    Text("This text is globally adaptive")
                        .foregroundColor(Color("AdaptiveColor"))
                    
                    Text("This text is locally adaptive")
                        .foregroundColor(colorScheme == .light ? .green : .yellow)
                    
                }
            }
            .navigationTitle("Dark mode bootcamp")
        }
        
    }
}

struct DarkMode__Previews: PreviewProvider {
    static var previews: some View {
        Group{
            DarkMode_()
                .preferredColorScheme(.light)
            DarkMode_()
                .preferredColorScheme(.dark)
        }
    }
}
