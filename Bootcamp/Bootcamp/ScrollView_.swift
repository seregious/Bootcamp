//
//  ScrollView_.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 10.02.2022.
//

import SwiftUI

struct ScrollView_: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            LazyVStack {
                ForEach(0..<50) {index in
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        HStack{
                            ForEach(0..<10) {index in
                            RoundedRectangle(cornerRadius: 50)
                                .fill(.white)
                                .frame(width: 150, height: 150)
                                .shadow(color: .black, radius: 7, x: 5, y: 5)
                                .padding()
                            }
                        }
                    }
                }
            }
        }
    }
}


struct ScrollView__Previews: PreviewProvider {
    static var previews: some View {
        ScrollView_()
    }
}
