//
//  EnvironmentObject_.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 16.02.2022.
//

import SwiftUI

class EnvironmentViewModel : ObservableObject {
    
    @Published var dataArray: [String] = []
    
    init () {
        getData()
    }
    
    func getData() {
        self.dataArray.append(contentsOf: ["Iphone", "iPad", "iMac", "Apple Watch"])
    }
}

struct EnvironmentObject_: View {
    var body: some View {
        NavigationView {
            List {
                
            }
        }
    }
}

struct EnvironmentObject__Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentObject_()
    }
}
