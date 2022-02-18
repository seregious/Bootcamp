//
//  MaskModifier.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 18.02.2022.
//

import SwiftUI

struct MaskModifier: View {
    
    @State var rating = 2
    
    var body: some View {
        ZStack {
            starView
                .overlay {
                   overlayView
                        .mask(starView)
                }
        }
    }
    
    private var overlayView : some View {
        GeometryReader {geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(.yellow)
                    .frame(width: CGFloat(rating)/5 * geometry.size.width)
            }
        }
        .allowsHitTesting(false)
    }
    
    private var starView : some View {
        HStack {
            ForEach(1..<6) { index in
                Image(systemName: "star.fill")
                    .font(.largeTitle)
                    .foregroundColor(Color.gray)
                    .onTapGesture {
                        withAnimation(.spring()) {
                        rating = index
                        }
                    }
            }
            
        }
    }
}

struct MaskModifier_Previews: PreviewProvider {
    static var previews: some View {
        MaskModifier()
    }
}
