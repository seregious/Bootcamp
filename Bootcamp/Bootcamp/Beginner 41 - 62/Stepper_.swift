//
//  Stepper_.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 15.02.2022.
//

import SwiftUI

struct Stepper_: View {
    
    @State var stepperValue = 10
    @State var widthIncrement : CGFloat = 100
    
    var body: some View {
        VStack{
        Stepper("Stepper: \(stepperValue)", value: $stepperValue)
            
            RoundedRectangle(cornerRadius: 25)
                .frame(width: widthIncrement, height: 100)
            
            Stepper("Stepper 2") {
                 incrementWidth(amount: 50)
            } onDecrement: {
                incrementWidth(amount: -50)
            }
            

        }
        .padding()
    }
    
    func incrementWidth(amount: CGFloat) {
        withAnimation(.easeInOut) {
            widthIncrement += amount

        }
    }
}

struct Stepper__Previews: PreviewProvider {
    static var previews: some View {
        Stepper_()
    }
}
