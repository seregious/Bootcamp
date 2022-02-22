//
//  Typealias_.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 21.02.2022.
//

import SwiftUI

struct MovieModel {
    let title : String
    let director : String
    let count : Int
}

typealias TVModel = MovieModel

struct Typealias_: View {
    
    @State var item : MovieModel = MovieModel(title: "Title", director: "Joe", count: 5)
    
    var body: some View {
        VStack {
            Text(item.title)
            Text(item.director)
            Text("\(item.count)")
        }
    }
}

struct Typealias__Previews: PreviewProvider {
    static var previews: some View {
        Typealias_()
    }
}
