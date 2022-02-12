//
//  SafeArea.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 10.02.2022.
//

import SwiftUI

struct SafeArea: View {
    var body: some View {

            ScrollView {
            VStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
                Spacer()
            }
            
    }
            .background(
                Color.blue
                    .ignoresSafeArea()
            )
    }
}

struct SafeArea_Previews: PreviewProvider {
    static var previews: some View {
        SafeArea()
    }
}
