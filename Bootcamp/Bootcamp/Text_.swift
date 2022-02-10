//
//  ContentView.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 09.02.2022.
//

import SwiftUI

struct Text_: View {
    var body: some View {
        Text("lol \nkek \ncheburek".capitalized)
            .font(.body)
            .fontWeight(.semibold)
            .bold()
            .underline(true, color: .green)
            .italic()
            .strikethrough(true, color: .red)
            .kerning(10)
            .foregroundColor(.blue)
            .multilineTextAlignment(.center)
            .minimumScaleFactor(0.1)
            .frame(width: 170, height: 100, alignment: .trailing)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Text_()
    }
}
