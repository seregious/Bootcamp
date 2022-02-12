//
//  ExtractingFunctions.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 11.02.2022.
//

import SwiftUI

struct ExtractFunctions: View {
    
    @State var backgroundColor = Color.pink

    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()
            
            contentLayer
        }
    }
    
    var contentLayer: some View {
        VStack {
            Text("Title")
                .font(.largeTitle)
            Button {
                buttonPressed()
            } label: {
                Text("Prress me")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(.black)
                    .cornerRadius(10)
            }

        }
    }
    
    func buttonPressed() {
        backgroundColor = .yellow
    }
}

struct ExtractingFunctions_Previews: PreviewProvider {
    static var previews: some View {
        ExtractFunctions()
    }
}
