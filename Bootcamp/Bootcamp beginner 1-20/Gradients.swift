//
//  GradientView.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 09.02.2022.
//

import SwiftUI

struct Gradients: View {
    var body: some View {
        VStack{
        RoundedRectangle(cornerRadius: 25)
            .fill(
                LinearGradient(
                    colors: [.red, .blue, .orange, .purple],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing)
            )
            .frame(width: 300, height: 200)
            
            RoundedRectangle(cornerRadius: 25)
                .fill(
                    RadialGradient(
                        gradient: Gradient(colors: [.red, .blue, .orange, .purple]),
                        center: .trailing,
                        startRadius: 5,
                        endRadius: 300)
                )
                .frame(width: 300, height: 200)
            
            RoundedRectangle(cornerRadius: 25)
                .fill(
                    AngularGradient(colors: [.red, .blue, .orange, .purple],
                                    center: .center,
                                    angle: .degrees(180))
                )
                .frame(width: 300, height: 200)
    }
    }
}

struct GradientView_Previews: PreviewProvider {
    static var previews: some View {
        Gradients()
    }
}
