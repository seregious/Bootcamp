//
//  Slider.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 15.02.2022.
//

import SwiftUI

struct Slider_: View {
    
    @State var sliderValue = 10.0
    @State var color : Color = .red
    
    var body: some View {
        VStack{
            Text("RAting")
            Text(
            String(format: "%.1f", sliderValue)
            )
                .foregroundColor(color)
            
            Slider(
                value: $sliderValue,
                in: 0...5,
                step: 1.0) {
                    Text("Title")
                } minimumValueLabel: {
                    Text("1")
                        .font(.largeTitle)
                        .foregroundColor(.yellow)
                        
                } maximumValueLabel: {
                    Text("5")
                        .font(.largeTitle)
                        .foregroundColor(.green)
                } onEditingChanged: { _ in
                    color = .green
                }
                .accentColor(.red)

        }
        .padding()
        
    }
}

struct Slider_Previews: PreviewProvider {
    static var previews: some View {
        Slider_()
    }
}
