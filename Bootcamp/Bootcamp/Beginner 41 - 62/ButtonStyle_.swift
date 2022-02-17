//
//  ButtonStyleControlSize.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 17.02.2022.
//

import SwiftUI

struct ButtonStyle_: View {
    var body: some View {
        
        HStack{
        VStack{
            
            Button("Button title") {
                
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .buttonStyle(.plain)
            
            Button("Button title") {
                
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .buttonStyle(.bordered)
            
            Button("Button title") {
                
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .buttonStyle(.borderedProminent)
            
            Button("Button title") {
                
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .buttonStyle(.borderless)
        }
        .padding()
        
        VStack{
            
            Button("Button title") {
                
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            
            Button("Button title") {
                
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .buttonStyle(.borderedProminent)
            .controlSize(.regular)
            
            Button("Button title") {
                
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .buttonStyle(.borderedProminent)
            .controlSize(.small)
            
            Button("Button title") {
                
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .buttonStyle(.borderedProminent)
            .controlSize(.mini)
        }
        .padding()
        }
    }
        
}

struct ButtonStyleControlSize_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStyle_()
    }
}
