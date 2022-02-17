//
//  Spacers.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 09.02.2022.
//

import SwiftUI

struct Spacers: View {
    var body: some View {
        VStack {
            
            HStack {
                Image(systemName: "xmark")
                Spacer()
                    .frame(height: 10)
                    .background(.orange)
                Image(systemName: "gear")

            }
            .padding()
            .background(.yellow)
            .font(.title)
            
            Spacer()
                .frame(width: 10)
                .background(.orange)
            
            HStack(spacing: 0) {
                
                Spacer()
                    .frame(height: 10)
                    .background(.orange)
                
                Rectangle()
                    .frame(width: 50, height: 50)
                
                Spacer()
                    .frame(height: 10)
                    .background(.orange)
                
                Rectangle()
                    .fill(.red)
                    .frame(width: 50, height: 50)
                
                Spacer()
                    .frame(height: 10)
                    .background(.orange)
                
                Rectangle()
                    .fill(.green)
                    .frame(width: 50, height: 50)
                
                Spacer()
                    .frame(height: 10)
                    .background(.orange)
            }
            .padding()
        }
        //.background(.blue)
    }
}

struct Spacers_Previews: PreviewProvider {
    static var previews: some View {
        Spacers()
    }
}
