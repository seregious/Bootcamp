//
//  Button_.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 10.02.2022.
//

import SwiftUI

struct Button_: View {
    @State var title = "This is title"
    
    var body: some View {
        VStack{
            Text(title)
            
        Button ("Button 1") {
            self.title = "first button Is pressed"
        }
            
            Button {
                self.title = "Second button is pressed"
            } label: {
                Text ("Button 2")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .padding()
                    .background(
                        Color.blue.cornerRadius(10)
                            .shadow(color: .black, radius: 10, x: 0, y: 0)
                    )
            }
            .accentColor(.red)
            
            Button {
                self.title = "Button 3"
            } label: {
                Circle()
                    .fill(.white)
                    .frame(width: 75, height: 75)
                    .shadow(color: .black, radius: 10, x: 0, y: 0)
                    .overlay(
                        Image(systemName: "heart.fill")
                            .font(.largeTitle)
                            .foregroundColor(.red)
                    )
            }
            
            Button {
                self.title = "Forth button"
            } label: {
                Text("Finish".uppercased())
                    .font(.caption)
                    .bold()
                    .foregroundColor(.gray)
                    .padding()
                    .background(
                        Capsule()
                            .stroke(.gray, lineWidth: 2)
                    )
            }



        }
        .font(.largeTitle)
    }
}

struct Button__Previews: PreviewProvider {
    static var previews: some View {
        Button_()
    }
}
