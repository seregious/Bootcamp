//
//  Frame.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 09.02.2022.
//

import SwiftUI

struct Frame: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .background(.green)
            //.frame(width: 300, height: 300, alignment: .topLeading)
            .frame(maxWidth: .infinity, alignment: .trailing)
            .background(.red)
    }
}

struct Frame_Previews: PreviewProvider {
    static var previews: some View {
        Frame()
    }
}
