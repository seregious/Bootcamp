//
//  Binding_.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 12.02.2022.
//

import SwiftUI

struct Binding_: View {
    
    @State var backgroundColor = Color.green
    @State var title = "Title"
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()
            
            VStack {
                Text(title)
                    .foregroundColor(.white)
                ButtonView(backgroundColor: $backgroundColor, title: $title)
            }

        }
    }
}

struct ButtonView : View {
    
    @Binding var backgroundColor : Color
    @State var buttonColor = Color.blue
    @Binding var title : String
    
    var body : some View {
        Button {
            backgroundColor = .orange
            buttonColor = .purple
            title = "New title"
        } label: {
            Text("Button")
                .foregroundColor(.white)
                .padding()
                .padding(.horizontal)
                .background(.blue)
                .cornerRadius(20)
        }
    }
}

struct Binding__Previews: PreviewProvider {
    static var previews: some View {
        Binding_()
    }
}
