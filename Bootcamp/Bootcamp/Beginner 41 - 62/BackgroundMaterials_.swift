//
//  BackgroundMaterials_.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 17.02.2022.
//

import SwiftUI

struct BackgroundMaterials_: View {
    var body: some View {
        VStack{
            Spacer()
            
            VStack{
                Text("Hi")
            }
            .frame(height: 350)
            .frame(maxWidth: .infinity)
            .background(.ultraThinMaterial)
            .cornerRadius(25)
        }
        .ignoresSafeArea()
        .background(
        Image("pigeon")
        )
    }
}

struct BackgroundMaterials__Previews: PreviewProvider {
    static var previews: some View {
        BackgroundMaterials_()
    }
}
