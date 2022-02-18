//
//  ScrollViewReader_.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 18.02.2022.
//

import SwiftUI

struct ScrollViewReader_: View {
    
    @State var text = ""
    @State var scrollTo = 0
    
    var body: some View {
        VStack {
            
            TextField("Enter a # here ...", text: $text)
                .frame(height: 55)
                .border(.gray)
                .padding()
                .padding(.horizontal)
                .keyboardType(.numberPad)
            
            Button("Scroll to \(text)") {
                withAnimation(.spring()){
                    if let index = Int(text) {
                        scrollTo = index
                    }
               // proxy.scrollTo(text, anchor: .center)
                }
            }
            
            ScrollView {
                ScrollViewReader { proxy in
                    
                    ForEach(0..<50) { index in
                        Text("This is item number \(index)")
                            .font(.headline)
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                            .background(.white)
                            .cornerRadius(25)
                            .shadow(radius: 10)
                            .padding()
                            .id(index)
                    }
                    .onChange(of: scrollTo) { value in
                        withAnimation(.spring()) {
                        proxy.scrollTo(value, anchor: .center)
                        }
                    }
                    
                }
            }
        }
    }
}

struct ScrollViewReader__Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewReader_()
    }
}
