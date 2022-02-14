//
//  TextField_.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 14.02.2022.
//

import SwiftUI

struct TextField_: View {
    
    @State var textField = ""
    @State var dataArray = [String]()
    
    var body: some View {
        NavigationView {
        VStack {
            TextField("something here", text: $textField)
                .padding()
                .background(Color.gray.opacity(0.3).cornerRadius(20))
                .foregroundColor(.white)
            
            Button {
                if textIfGood() {
                    saveText()
                }
            } label: {
                Text("Save")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(textIfGood() ? .blue : .gray)
                    .cornerRadius(20)
                    .foregroundColor(.white)
            }
            .disabled(!textIfGood())
            
            ForEach(dataArray, id: \.self) {data in
                Text(data)
            }
            
            Spacer()

        }
        .padding()
        .navigationTitle("text field bootcamp!".capitalized)
    }
        
}
    func textIfGood() -> Bool {
        if textField.count >= 3 {
            return true
        }
        return false
    }
    
    func saveText() {
        dataArray.append(textField)
        textField = ""
    }
}

struct TextField__Previews: PreviewProvider {
    static var previews: some View {
        TextField_()
    }
}
