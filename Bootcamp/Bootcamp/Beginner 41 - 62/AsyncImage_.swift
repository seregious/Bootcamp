//
//  AsyncImage.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 17.02.2022.
//

import SwiftUI

/*
 case empty
 No image is loaded.
 case success(Image)
 An image succesfully loaded.
 case failure(Error)
 An image failed to load with an error.
 */

struct AsyncImage_: View {
    
    let url = URL(string: "https://picsum.photos/400")
    
    var body: some View {
        VStack {
            AsyncImage(url: url, content: { returnedImage in
                returnedImage
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .cornerRadius(25)
            }, placeholder: {
                ProgressView()
        })
            
            AsyncImage(url: url) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let returnedImage):
                    returnedImage
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .cornerRadius(25)
                case .failure :
                    Image(systemName: "questionmark")
                }
            }
        }
            
    }
}

struct AsyncImage_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImage_()
    }
}
