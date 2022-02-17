//
//  H:V:ZStack.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 09.02.2022.
//

import SwiftUI

struct H_V_ZStack: View {
    var body: some View {
        
        
        ZStack {
            Rectangle()
                .fill(.mint)
                .frame(width: 350, height: 750)
            
            VStack {
                HStack(alignment: .center, spacing: 30) {
                    Rectangle()
                        .fill(.red)
                        .frame(width: 150, height: 300)
                    
                    VStack (alignment: .trailing, spacing: 2) {
                        
                        //  Group {
                        ZStack (alignment: .bottomLeading) {
                            Rectangle()
                                .fill(.orange)
                                .frame(width: 150, height: 150)
                            
                            Rectangle()
                                .fill(.purple)
                                .frame(width: 120, height: 120)
                            
                            Rectangle()
                                .fill(.blue)
                                .frame(width: 100, height: 100)
                        }
                        
                        
                        Rectangle()
                            .fill(.pink)
                            .frame(width: 150, height: 150)
                        
                        Rectangle()
                            .fill(.black)
                            .frame(width: 120, height: 120)
                        
                        Rectangle()
                            .fill(.green)
                            .frame(width: 100, height: 100)
                        //  }
                    }
                }
                
                HStack (alignment: .top, spacing: 7) {
                    Rectangle()
                        .fill(.yellow)
                        .frame(width: 150, height: 150)
                    
                    Rectangle()
                        .fill(.brown)
                        .frame(width: 120, height: 120)
                    
                    Rectangle()
                        .fill(.indigo)
                        .frame(width: 100, height: 100)
                }
            }
        }
        .shadow(color: .black.opacity(1), radius: 10, x: 0, y: 0)
    }
}

struct H_V_ZStack_Previews: PreviewProvider {
    static var previews: some View {
        H_V_ZStack()
    }
}
