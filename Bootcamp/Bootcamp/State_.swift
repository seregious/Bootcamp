//
//  State.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 11.02.2022.
//

import SwiftUI

struct State_: View {
    
    @State var backgroundColor = Color.green
    @State var myTitle = "My title"
    @State var count = 0
    
    var body: some View {
        ZStack{
            backgroundColor
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text(myTitle)
                    .font(.title)
                Text("Count: \(count)")
                    .font(.headline)
                    .underline()
                
                HStack(spacing: 20) {
                    Button ("Button 1") {
                        backgroundColor = .red
                        myTitle = "Button 1 pressed"
                        count += 1
                    }
                    
                        Button ("Button 2") {
                            backgroundColor = .purple
                            myTitle = "Button 2 pressed"
                            count -= 1
                        }
                }
            }
            .foregroundColor(.white)
        }
    }
}

struct State_Previews: PreviewProvider {
    static var previews: some View {
        State_()
    }
}
