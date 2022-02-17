//
//  ColorPicker_.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 15.02.2022.
//

import SwiftUI

struct ColorPicker_: View {
    
    @State var backgroundColor = Color.green
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()
            
            ColorPicker("Select a color", selection: $backgroundColor, supportsOpacity: true)
                .padding()
                .background(.black)
                .foregroundColor(.white)
                .cornerRadius(20)
                .padding()
                .shadow(color: .white, radius: 10, x: 0, y: 0)
        }
    }
}

struct ColorPicker__Previews: PreviewProvider {
    static var previews: some View {
        ColorPicker_()
    }
}
