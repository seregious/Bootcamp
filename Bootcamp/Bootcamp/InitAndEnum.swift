//
//  InitAndEnum.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 09.02.2022.
//

import SwiftUI

struct InitAndEnum: View {
    
    let backgroundColor : Color
    let count : Int
    let titles : String
    
    init(count : Int, fruit : Fruits) {
        self.count = count
        
        switch fruit {
        case .apples : self.backgroundColor = .red; self.titles = "Apples"
        case .oranges : self.backgroundColor = .orange; self.titles = "Oranges"
        }
    }
    
    enum Fruits {
        case apples
        case oranges
    }
    
    var body: some View {
        VStack (spacing: 10){
            Text("\(count)")
                .font(.largeTitle)
                .underline()
            Text("\(titles)")
        }
        .foregroundColor(.white)
        .frame(width: 150, height: 150)
        .background(backgroundColor)
        .cornerRadius(20)
    }
}

struct InitAndEnum_Previews: PreviewProvider {
    static var previews: some View {
        InitAndEnum(count: 15, fruit: .oranges)
    }
}
