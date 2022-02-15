//
//  AnimationTiming.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 13.02.2022.
//

import SwiftUI

struct AnimationTiming: View {
    
    @State var animate = false
    let timing = 10.0
    
    var body: some View {
        VStack {
            Button ("Button") {
                animate.toggle()
            }
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: animate ? 350 : 50, height: 100)
                .animation(Animation.spring(
//                    response: 3,
//                    dampingFraction: 1,
//                    blendDuration: 1
                ))
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: animate ? 350 : 50, height: 100)
                .animation(Animation.linear(duration: timing))
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: animate ? 350 : 50, height: 100)
                .animation(Animation.easeIn(duration: timing))
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: animate ? 350 : 50, height: 100)
                .animation(Animation.easeInOut(duration: timing))
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: animate ? 350 : 50, height: 100)
                .animation(Animation.easeOut(duration: timing))
        }
    }
}

struct AnimationTiming_Previews: PreviewProvider {
    static var previews: some View {
        AnimationTiming()
    }
}
