//
//  BackgroundAndOverlay.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 09.02.2022.
//

import SwiftUI

struct BackgroundAndOverlay: View {
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .frame(width: 100, height: 100, alignment: .center)
                .background(
                    //.red
                    //LinearGradient
                    Circle()
                        .fill(LinearGradient(colors: [.red, .blue], startPoint: .leading, endPoint: .trailing))
                )
                .frame(width: 120, height: 120, alignment: .center)
                .background(
                    Circle()
                        .fill(LinearGradient(colors: [.red, .blue], startPoint: .trailing, endPoint: .leading))
                )
            Circle()
                .fill(.pink)
                .frame(width: 100, height: 100, alignment: .center)
                .overlay(
                    Text("lol")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                )
                .background(
                    Circle()
                        .fill(.purple)
                        .frame(width: 120, height: 120, alignment: .center)
                )
            
            Rectangle()
                .frame(width: 100, height: 100, alignment: .center)
                .overlay(
                    Rectangle()
                        .fill(.blue)
                        .frame(width: 50, height: 50, alignment: .center),
                    alignment: .trailing
                )
                .background(
                    Rectangle()
                        .fill(.red)
                        .frame(width: 150, height: 150, alignment: .center),
                    alignment: .trailing
                )
                .padding()
            
            Image(systemName: "heart.fill")
                .font(.system(size: 40))
                .foregroundColor(.white)
                .background(
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [.purple, .red],
                                startPoint: .bottomTrailing,
                                endPoint: .topLeading)
                        )
                        .frame(width: 100, height: 100, alignment: .center)
                        .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 10)
                        .overlay(
                            Circle()
                                .fill(.blue)
                                .frame(width: 35, height: 35)
                                .overlay(
                                    Text("5")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                )
                                .shadow(color: .purple.opacity(0.5), radius: 10, x: 5, y: 5)
                            ,alignment: .bottomTrailing
                        )
                )
                .padding(50)
        }
    }
}

struct BackgroundAndOverlay_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundAndOverlay()
    }
}
