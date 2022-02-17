//
//  LongPressGesture_.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 18.02.2022.
//

import SwiftUI

struct LongPressGesture_: View {
    
    @State var isComplete = false
    @State var isSuccsess = false
    
    var body: some View {
        
        VStack {
            Rectangle()
                .fill(isSuccsess ? .green : .blue)
                .frame(maxWidth: isComplete ? .infinity : 0)
                .frame(height: 55)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.gray)
            
            
            HStack {
                Text("Click here")
                    .foregroundColor(.white)
                    .padding()
                    .background(.black)
                    .cornerRadius(10)
                    .onLongPressGesture(minimumDuration: 1, maximumDistance: 50) {
                        withAnimation(.easeInOut) {
                            isSuccsess = true
                        }
                    } onPressingChanged: { isPressing in
                        if isPressing {
                            withAnimation(.easeInOut(duration: 1)) {
                                isComplete = true
                            }
                        } else {
                            DispatchQueue.main.asyncAfter(deadline: .now()+0.1) {
                                if !isSuccsess {
                                    withAnimation(.easeInOut) {
                                        isComplete = false
                                    }
                                }
                            }
                        }
                    }
                
                
                
                Text("Reset")
                    .foregroundColor(.white)
                    .padding()
                    .background(.black)
                    .cornerRadius(10)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                        isComplete = false
                        isSuccsess = false
                        }
                    }
                
            }
            
        }
        
        //        Text(isComplete ? "Completed" : "Not comlete")
        //            .padding()
        //            .background(isComplete ? .green : .gray)
        //            .cornerRadius(10)
        ////            .onTapGesture {
        ////                isComplete.toggle()
        ////            }
        //            .onLongPressGesture(minimumDuration: 1, maximumDistance: 50) {
        //                isComplete.toggle()
        //            }
    }
}

struct LongPressGesture__Previews: PreviewProvider {
    static var previews: some View {
        LongPressGesture_()
    }
}
