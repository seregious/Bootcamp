//
//  ConditionalStatement.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 12.02.2022.
//

import SwiftUI

struct ConditionalStatement: View {
    
    @State var showCircle = false
    @State var showRectangle = false
    @State var isLoaading = false
    
    
    var body: some View {
        VStack(spacing: 20) {
            
            Button("Is loading: \(isLoaading.description)") {
                isLoaading.toggle()
            }
            
            if isLoaading {
                ProgressView()
            }
            
            Button("Circle Button: \(showCircle.description)") {
                showCircle.toggle()
            }
            
            Button("Rectangle Button: \(showRectangle.description)") {
                    showRectangle.toggle()
            }
            
            if showCircle {
            Circle()
                .frame(width: 100, height: 100)
            }
            if showRectangle {
                Rectangle()
                    .frame(width: 100, height: 100)
            }
            
            if showCircle && showRectangle {
                RoundedRectangle(cornerRadius: 30)
                    .frame(width: 100, height: 100)
            }
        }
    }
}

struct ConditionalStatement_Previews: PreviewProvider {
    static var previews: some View {
        ConditionalStatement()
    }
}
