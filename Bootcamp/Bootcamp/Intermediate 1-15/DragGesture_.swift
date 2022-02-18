//
//  DragGesture_.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 18.02.2022.
//

import SwiftUI

struct DragGesture_: View {
    
    @State var offset : CGSize = .zero
    
    var body: some View {
        ZStack {
            
            VStack {
                Text("\(offset.width)")
                Spacer()
            }
            
            RoundedRectangle(cornerRadius: 25)
                .frame(width: 300, height: 500)
                .offset(offset)
                .scaleEffect(getScaleAmount())
                .rotationEffect(Angle(degrees: getRotationAmount()))
                .gesture(
                DragGesture()
                    .onChanged({ value in
                        withAnimation(.spring()){
                        offset = value.translation
                        }
                    })
                    .onEnded({ value in
                        withAnimation(.spring()){
                            offset = .zero
                        }
                    })
            )
        }
    }
    
    func getScaleAmount() -> CGFloat {
        let max = UIScreen.main.bounds.width / 2
        let currentAmount = abs(offset.width)
        let percentage = currentAmount / max
        return 1.0 - min(percentage, 0.5) * 0.5
    }
    
    func getRotationAmount() -> Double {
        let max = UIScreen.main.bounds.width / 2
        let currentAmount = offset.width
        let percentage = currentAmount / max
        let maxAngle : Double = 10
        return Double(percentage) * maxAngle
    }
}

struct DragGesture__Previews: PreviewProvider {
    static var previews: some View {
        DragGesture_()
    }
}
