//
//  ContextMenu_.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 14.02.2022.
//

import SwiftUI

struct ContextMenu_: View {
    
    @State var backgroundColor : Color = .blue
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20.0){
            Image(systemName: "house.fill")
                .font(.title)
            Text("Plaskanev")
                .font(.headline)
            Text("How to use context menu")
                .font(.subheadline)
        }
        .padding(30)
        .background(backgroundColor)
        .foregroundColor(.white)
        .cornerRadius(30)
        .contextMenu {
            Button {
                backgroundColor = .yellow
            } label: {
                Label("Share", systemImage: "flame.fill")
            }
            
            Button {
                backgroundColor = .red
            } label: {
                Text("Like")
            }
            
            Button {
                backgroundColor = .green
            } label: {
                HStack {
                    Text("Repost")
                    Image(systemName: "heart.fill")
                }
            }

        }
    }
}

struct ContextMenu__Previews: PreviewProvider {
    static var previews: some View {
        ContextMenu_()
    }
}
