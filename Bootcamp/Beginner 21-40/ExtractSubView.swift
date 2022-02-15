//
//  ExtractSubView.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 12.02.2022.
//

import SwiftUI

struct ExtractSubView: View {
    var body: some View {
        ZStack {
            Color.teal
                .ignoresSafeArea()
            
            contentLayer
        }
    }
    
    var contentLayer : some View {
        HStack {
        myItem(title: "Apples", count: 1, color: .red)
        myItem(title: "Oranges", count: 3, color: .orange)
        myItem(title: "Bananas", count: 5, color: .yellow)
        }
    }
}

struct ExtractSubView_Previews: PreviewProvider {
    static var previews: some View {
        ExtractSubView()
    }
}

struct myItem: View {
    
    let title: String
    let count: Int
    let color: Color
    
    var body: some View {
        VStack {
            Text("\(count)")
            Text(title)
        }
        .padding()
        .background(color)
        .cornerRadius(10)
    }
}
