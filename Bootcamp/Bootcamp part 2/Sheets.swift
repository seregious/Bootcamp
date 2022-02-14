//
//  Sheets.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 13.02.2022.
//

import SwiftUI

struct Sheets: View {
    
    @State var showSheet = false
    
    var body: some View {
        ZStack {
            Color.green
                .ignoresSafeArea()
            
            Button {
                showSheet.toggle()
            } label: {
                Text("Button")
                    .foregroundColor(.green)
                    .font(.headline)
                    .padding()
                    .background(.white)
                    .cornerRadius(20)
                
            }
            
//            .fullScreenCover(isPresented: $showSheet) {
//                SecondScreen()
//            }
            //only one of this
            .sheet(isPresented: $showSheet) {
                //do ont add logic
                SecondScreen()
            }


        }
    }
}


struct SecondScreen : View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.red
                .ignoresSafeArea()
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .font(.title)
                    .padding()
                    
                
            }
        }
    }
}


struct Sheets_Previews: PreviewProvider {
    static var previews: some View {
        Sheets()
        //SecondScreen()
    }
}
