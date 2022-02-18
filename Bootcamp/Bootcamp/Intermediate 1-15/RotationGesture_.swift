//
//  RotationGesture_.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 18.02.2022.
//

import SwiftUI

struct RotationGesture_: View {
    
    @State var angle : Angle = Angle(degrees: 0)
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .padding(50)
            .background(.blue)
            .cornerRadius(25)
            .rotationEffect(angle)
            .gesture(
                RotationGesture()
                    .onChanged({ value in
                        angle = value
                    })
                    .onEnded( {value in
                        withAnimation(.spring()){
                            angle = Angle(degrees: 0)
                        }})
            )
    }
}

struct RotationGesture__Previews: PreviewProvider {
    static var previews: some View {
        RotationGesture_()
    }
}
