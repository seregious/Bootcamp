//
//  Protocols.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 19.03.2022.
//

import SwiftUI

struct DefaultColorTheme: ColorThemeProtocol {
    let primary : Color = .blue
    let secondary : Color = .white
    let tertiary : Color = .gray
}

struct AlternativeColorTheme: ColorThemeProtocol {
    let primary : Color = .red
    let secondary : Color = .white
    let tertiary : Color = .green
}

struct AnotherColorTheme : ColorThemeProtocol {
    var primary: Color = .blue
    var secondary: Color = .red
    var tertiary: Color = .purple
}

protocol ColorThemeProtocol {
    var primary : Color { get }
    var secondary : Color { get }
    var tertiary : Color { get }
}

protocol ButtonTextProtocol {
    var buttonText : String {get}
}

protocol ButtonPressedProtocol {
    func buttonPressed()
}

protocol ButtonDataSourceProtocol : ButtonTextProtocol, ButtonPressedProtocol {
    
}

class DefaultDataSourse : ButtonDataSourceProtocol {
    var buttonText : String = "Protocols are awesome"
    func buttonPressed() {
        
    }
}

class AlternativeDataSourse : ButtonDataSourceProtocol {
    var buttonText : String = "Protocols are lame"
    func buttonPressed() {
        
    }
}

struct Protocols: View {
    
    let colorTheme : ColorThemeProtocol = AnotherColorTheme()
    let dataSource : ButtonDataSourceProtocol = DefaultDataSourse()
    
    var body: some View {
        ZStack{
            colorTheme.tertiary
                .ignoresSafeArea()
            
            Text(dataSource.buttonText)
                .font(.headline)
                .foregroundColor(colorTheme.secondary)
                .padding()
                .background(colorTheme.primary)
                .cornerRadius(25)
                .onTapGesture {
                    dataSource.buttonPressed()
                }
        }
    }
}

struct Protocols_Previews: PreviewProvider {
    static var previews: some View {
        Protocols()
    }
}
