//
//  TernaryOperator.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 12.02.2022.
//

import SwiftUI

struct TernaryOperator: View {
    
    @State var isStart = false
    
    var body: some View {
        VStack {
            Button("Button: \(isStart.description)") {
                isStart.toggle()
            }
            
            RoundedRectangle(cornerRadius: isStart ? 25 : 50)
                .fill(isStart ? .red : .green)
                .frame(width: 200, height: 100)
            
            Spacer()
        }
    }
}

struct TernaryOperator_Previews: PreviewProvider {
    static var previews: some View {
        TernaryOperator()
    }
}
