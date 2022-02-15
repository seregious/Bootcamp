//
//  TextEditor_.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 15.02.2022.
//

import SwiftUI

struct TextEditor_: View {
    
    @State var textEditor = "Starting text"
    @State var savedText = ""
    
    var body: some View {
        NavigationView{
            VStack{
                TextEditor(text: $textEditor)
                    .frame(height: 250)
                    .colorMultiply(.mint)
                    .cornerRadius(20)
                
                
                Button {
                    savedText = textEditor
                } label: {
                    Text("Save")
                        .font(.headline)
                        .padding()
                        .background(.blue)
                        .cornerRadius(20)
                        .foregroundColor(.white)
                }
                
                Text(savedText)
                
                Spacer()
            }
            .padding()
            .background(.gray)
            .navigationTitle("Text editor bootcamp!".capitalized)
        }
    }
}

struct TextEditor__Previews: PreviewProvider {
    static var previews: some View {
        TextEditor_()
    }
}
