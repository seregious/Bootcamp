//
//  HashableProtocol.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 19.02.2022.
//

import SwiftUI

struct MyCustomModel : Hashable {
    let id = UUID().uuidString
    let title : String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
}


struct HashableProtocol: View {
    
    let data : [MyCustomModel] = [
    MyCustomModel(title: "one"),
    MyCustomModel(title: "two"),
    MyCustomModel(title: "three"),
    MyCustomModel(title: "four"),
    MyCustomModel(title: "five")
    ]

    
    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                ForEach(data, id: \.self) {item in
                    Text(item.hashValue.description)
                        .font(.headline)
                }
            }
        }
    }
}

struct HashableProtocol_Previews: PreviewProvider {
    static var previews: some View {
        HashableProtocol()
    }
}
