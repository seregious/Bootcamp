//
//  MagnificationGesture_.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 18.02.2022.
//

import SwiftUI

struct MagnificationGesture_: View {
    
    @State var currentAmount : CGFloat = 0
    @State var lastAmount : CGFloat = 0
    
    var body: some View {
        VStack{
            
            HStack{
                Circle().frame(width: 35, height: 35)
                Text("Name")
                
                Spacer()
                
                Image(systemName: "ellipsis")
                
            }
            .padding(.horizontal)
            
            
            Rectangle()
                .frame(height: 300)
                .scaleEffect(1 + currentAmount)
                .gesture(
                MagnificationGesture()
                    .onChanged({ value in
                        currentAmount = value - 1
                    })
                    .onEnded({ value in
                        withAnimation(.spring()) {
                        currentAmount = 0
                        }
                    })
                )
            
            HStack{
                Image(systemName: "heart.fill")
                Image(systemName: "text.bubble.fill")
                Spacer()
            }
            .font(.headline)
            .padding(.horizontal)
            
            Text("This is caption for my photo")
                .frame(maxWidth: .infinity ,alignment: .leading)
                .padding(.horizontal)
            
        
//        Spacer()
//                
//        
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            .font(.title)
//            .padding(40)
//            .background(.red)
//            .cornerRadius(25)
//            .scaleEffect(1 + currentAmount + lastAmount)
//            .gesture(
//                MagnificationGesture()
//                    .onChanged({ value in
//                        currentAmount = value - 1
//                    })
//                    .onEnded({ value in
//                        lastAmount += currentAmount
//                        currentAmount = 0
//                    })
//                
//            )
        }
    }
}

struct MagnificationGesture__Previews: PreviewProvider {
    static var previews: some View {
        MagnificationGesture_()
    }
}
