//
//  ForEach_.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 10.02.2022.
//

import SwiftUI

struct ForEach_: View {
    
    let data : [String] = ["0", "1", "2", "3", "4", "5", "6", "7"]
    let myString : String = "Holla"
    
    var body: some View {
        VStack {
            ForEach(data.indices) {index in
                Text("\(data[index]): \(index)")
            }
            
        }
    }
}

struct ForEach__Previews: PreviewProvider {
    static var previews: some View {
        ForEach_()
    }
}
