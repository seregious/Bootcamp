//
//  ColorsView.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 09.02.2022.
//

import SwiftUI

struct Colors: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(
                //.primary
                //Color(#colorLiteral(red: 0, green: 1, blue: 1, alpha: 1))
                Color(UIColor.secondarySystemBackground)
                //Color("colors")
            )

            .frame(width: 300, height: 200)
            .shadow(color: .primary.opacity(0.7), radius: 10, x: 10, y: 10)
    }
}

struct ColorsView_Previews: PreviewProvider {
    static var previews: some View {
        Colors()
            
            
            
    }
}
