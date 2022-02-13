//
//  ImageView.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 09.02.2022.
//

import SwiftUI

struct Image_: View {
    var body: some View {
        VStack {
        Image("pigeon")
            .resizable()
            //.aspectRatio(contentMode: .fit)
            .scaledToFill()
            .frame(width: 300, height: 200)
            .clipped()
            .cornerRadius(30)
            .clipShape(Circle())
        
            Image("letter")
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 200)
                .foregroundColor(.red)
    }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        Image_()
    }
}
