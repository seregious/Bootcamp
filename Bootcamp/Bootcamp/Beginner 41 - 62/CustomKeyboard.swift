//
//  onSubmitLabel.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 18.02.2022.
//

import SwiftUI

struct CustomKeyboard: View {
    
    @State private var text = ""
    
    var body: some View {
        TextField("Placeholder", text: $text)
            .submitLabel(.join)
            .onSubmit {
                //some code
            }
    }
}

struct onSubmitLabel_Previews: PreviewProvider {
    static var previews: some View {
        CustomKeyboard()
    }
}
