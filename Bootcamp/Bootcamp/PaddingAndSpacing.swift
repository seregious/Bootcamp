//
//  PaddingAndSpacing.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 09.02.2022.
//

import SwiftUI

struct PaddingAndSpacing: View {
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.bottom)
            
            Text("Padding is a SwiftUI developer's best friend. In this video we learn how to use the .padding() modifier to align and offset views in our iOS application. Padding is often used to add space between objects or to add a margin between an object and the edge of the device. We look at different ways to implement padding, including setting the padding to specific sides (vertical, horizontal, top, bottom, leading, trailing) and how to stack padding modifiers on top of each other!")
        }
        .padding()
        .padding(.vertical)
        .background(
            Color.white
                .cornerRadius(30)
                .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 10)
        )
        .padding()

    }
}

struct PaddingAndSpacing_Previews: PreviewProvider {
    static var previews: some View {
        PaddingAndSpacing()
    }
}
