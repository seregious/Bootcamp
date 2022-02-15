//
//  Picker_.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 15.02.2022.
//

import SwiftUI

struct Picker_: View {
    
    @State var selection = "Most Recent"
    let filterOption = ["Most Recent", "Most Popular", "Most Liked"]
    
    init () {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor.red
        
        let attributes : [NSAttributedString.Key : Any] = [
            .foregroundColor : UIColor.white
        ]
        UISegmentedControl.appearance().setTitleTextAttributes(attributes, for: .selected)
    }
    
    var body: some View {
        VStack{
            
            Text("Menu")
            picker
                .pickerStyle(.menu)
                .accentColor(.white)
            
            Spacer()
            
            Text("Segmented")
            picker
                .pickerStyle(.segmented)
            
            
            
            
            Spacer()
            
            
            Text("Wheel")
            picker
                .pickerStyle(.wheel)
        }
    }
    
    var picker : some View {
        Picker(selection: $selection) {
            
            ForEach(filterOption, id: \.self) {option in
                
                HStack{
                Text(option)
                //Image(systemName: "heart.fill")
                }
                .foregroundColor(.white)
                .tag("\(option)")
            }
            
        } label: {
            pickerLabel
        }
        .padding(10)
        .background(.mint.opacity(0.4))
        .cornerRadius(20)
        .shadow(color: .blue.opacity(0.7), radius: 10, x: 0, y: 10)
        .padding()
        
    }
    
    var pickerLabel : some View {
        HStack {
        Text("Filter")
            Text(selection)
        }
        .font(.headline)
        .background(.blue)
    }
}

struct Picker__Previews: PreviewProvider {
    static var previews: some View {
        Picker_()
    }
}
