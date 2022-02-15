//
//  LazyGrids_GridsItems.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 10.02.2022.
//

import SwiftUI

struct LazyGrids_GridsItems: View {
    
    let colums : [GridItem] = [
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil)
    ]
    var body: some View {
        ScrollView {
            
            Rectangle()
                .fill(.orange)
                .frame(height: 400)
            
        LazyVGrid(columns: colums,
                  alignment: .center,
                  spacing: nil,
                  pinnedViews: [.sectionHeaders]
        ) {
            Section(header:
                        Text("Section 1")
                        .foregroundColor(.white)
                        .font(.title)
                        .background(.blue)
                        .padding()
            ){
            ForEach(0..<10) {index in
                RoundedRectangle(cornerRadius: 15)
                    .frame(height: 130)
            }
            }
            
            Section(header:
                        Text("Section 2")
                        .foregroundColor(.white)
                        .font(.title)
                        .background(.red)
                        .padding()
            ){
            ForEach(0..<10) {index in
                RoundedRectangle(cornerRadius: 15)
                    .frame(height: 130)
            }
            }
        }
    }
        .padding()
}
}

struct LazyGrids_GridsItems_Previews: PreviewProvider {
    static var previews: some View {
        LazyGrids_GridsItems()
    }
}
