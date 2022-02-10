//
//  ShapesView.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 09.02.2022.
//

import SwiftUI

struct Shapes: View {
    var body: some View {
        Circle()
        //Ellipse()
        //Capsule()
        //Rectangle()
        //RoundedRectangle(cornerRadius: 20)
            //.fill(.blue)
            //.stroke(.pink, lineWidth: 20)
            .trim(from: 0.3, to: 1)
            //.stroke(.purple, lineWidth: 50)
            .stroke(.orange, style: StrokeStyle(lineWidth: 20, lineCap: .square, dash: [50]))
            .padding()
        
    }
}

struct ShapesView_Previews: PreviewProvider {
    static var previews: some View {
        Shapes()
    }
}
