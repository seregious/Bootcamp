//
//  Toogle_.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 15.02.2022.
//

import SwiftUI

struct Toogle_: View {
    
    @State var toogle = false
    
    var body: some View {
        
        VStack {
            
            HStack {
            Text("Status")
                Text(toogle ? "Online" : "Offline")
            }
        
        Toggle(isOn: $toogle) {
            Text("Change status")
        }
        .toggleStyle(SwitchToggleStyle(tint: .blue))
            
            Spacer()
    }
        .padding()
    }
}

struct Toogle__Previews: PreviewProvider {
    static var previews: some View {
        Toogle_()
    }
}
