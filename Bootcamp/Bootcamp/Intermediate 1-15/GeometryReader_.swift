//
//  GeometryReader_.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 18.02.2022.
//

import SwiftUI

struct GeometryReader_: View {
    
    func getPercentage(geo: GeometryProxy) -> Double {
        let maxDistance = UIScreen.main.bounds.width / 2
        let currentX = geo.frame(in: .global).midX
        return Double(1 - (currentX / maxDistance))
    }
    
    var body: some View {
        
        
            
            ZStack {
                
                ScrollView(.horizontal, showsIndicators: true) {
                    HStack{
                        ForEach(0..<20) {index in
                            GeometryReader { geometry in
                            RoundedRectangle(cornerRadius: 25)
                                .rotation3DEffect(
                                    Angle(degrees: getPercentage(geo: geometry) * 40),
                                    axis: (x: 0, y: 1, z: 0))
                            }
                                .frame(width: 300, height: 250)
                                .padding()
                        }
                    }
                }
                
//                HStack(spacing: 0) {
//                    Rectangle()
//                        .fill(.red)
//                        .frame(width: geometry.size.width * 0.66)
//                    Rectangle()
//                        .fill(.blue)
//                }
//                .ignoresSafeArea()
            
        }
    }
}

struct GeometryReader__Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader_()
            .previewInterfaceOrientation(.portrait)
    }
}
