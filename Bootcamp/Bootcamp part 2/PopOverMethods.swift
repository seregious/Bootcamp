//
//  PopOverMethods.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 13.02.2022.
//

import SwiftUI

struct PopOverMethods: View {
    
    @State var showNewScreen = false
    
    var body: some View {
        ZStack{
            
            Color.orange
                .ignoresSafeArea()
            
            VStack{
                Button("BUTTON"){
                    showNewScreen.toggle()
                }
                .font(.largeTitle)
                
                Spacer()
            }
            
            // Method 1 - sheet
            //            .sheet(isPresented: $showNewScreen) {
            //                NewScreen()
            //            }
            
            
            // Method 2 - transition
//            ZStack {
//                if showNewScreen {
//                    NewScreen(showNewScreen: $showNewScreen)
//                        .transition(.move(edge: .bottom))
//                        .animation(.spring())
//                }
//            }
//            .zIndex(2)
            
            //Method 3 - Offset
            
            NewScreen(showNewScreen: $showNewScreen)
                .padding(.top)
                .offset(y: showNewScreen ? 0 : UIScreen.main.bounds.height)
                .animation(.spring())
        }
    }
}


struct NewScreen : View {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var showNewScreen : Bool
    
    var body : some View {
        ZStack(alignment: .topLeading){
            Color.purple
                .ignoresSafeArea()
            
            Button {
                //presentationMode.wrappedValue.dismiss()
                showNewScreen.toggle()
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding()
            }
            
        }
    }
}

struct PopOverMethods_Previews: PreviewProvider {
    static var previews: some View {
        PopOverMethods()
    }
}
