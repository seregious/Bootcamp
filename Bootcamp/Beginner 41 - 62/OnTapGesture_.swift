//
//  OnTapGesture_.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 16.02.2022.
//

import SwiftUI

struct OnTapGesture_: View {
    
    @State var isSelected = false
    
    var body: some View {
        VStack(spacing: 40) {
            
            RoundedRectangle(cornerRadius: 25)
                .frame(height: 200)
                .foregroundColor(isSelected ? .green : .red)
            
            Button {
                isSelected.toggle()
            } label: {
                Text("Button")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .cornerRadius(25)
            }
            
            Text("Tap gesture")
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(.blue)
                .cornerRadius(25)
//                .onTapGesture {
//                    isSelected.toggle()
//                }
                .onTapGesture(count: 2) {
                    isSelected.toggle()
                }
            
            Spacer()

        }
        .padding(40)
    }
}

struct OnTapGesture__Previews: PreviewProvider {
    static var previews: some View {
        OnTapGesture_()
    }
}
