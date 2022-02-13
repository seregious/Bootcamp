//
//  Animation_.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 12.02.2022.
//

import SwiftUI

struct Animation_: View {
    
    @State var animated = false
    
    var body: some View {
        VStack {
            Button("Button") {
                //withAnimation(.default.delay(1)) {
                withAnimation(
                    Animation
                        .default
                    .repeatCount(5, autoreverses: true)
                        .repeatForever()){
                            animated.toggle()
                        }
            }
            
            Spacer()
            
            RoundedRectangle(cornerRadius: animated ? 20 : 60)
                .fill(animated ? .red : .green)
                .frame(width: animated ? 100 : 300, height: animated ? 100 : 300)
                .rotationEffect(.degrees(animated ? 360 : 0))
                .offset(y: animated ? 300 : 0)
//                .animation(Animation
//                            .default
//                            .repeatForever())
            
            
            Spacer()
        }
    }
}

struct Animation__Previews: PreviewProvider {
    static var previews: some View {
        Animation_()
    }
}
