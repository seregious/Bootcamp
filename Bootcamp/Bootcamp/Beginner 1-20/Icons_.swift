//
//  IconsView.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 09.02.2022.
//

import SwiftUI

struct Icons_: View {
    var body: some View {
        Image(systemName: "person.fill.badge.plus")
            .renderingMode(.original)
            .resizable()
            //.aspectRatio(contentMode: .fit)
            .scaledToFill()
            //.font(.title)
            //.font(.system(size: 200))
            .foregroundColor(.purple)
            .frame(width: 300, height: 300)
            .clipped()
    }
}

struct IconsView_Previews: PreviewProvider {
    static var previews: some View {
        Icons_()
    }
}

