//
//  OnAppearDisappear.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 16.02.2022.
//

import SwiftUI

struct OnAppearDisappear: View {
    
    @State var myText = "Start text"
    @State var count : Int = 0
    
    var body: some View {
        NavigationView {
            ScrollView {
                Text(myText)
                LazyVStack {
                    ForEach(0..<50) { _ in
                        RoundedRectangle(cornerRadius: 25)
                            .frame(height: 200)
                            .padding()
                            .onAppear {
                                count += 1
                            }
                    }
                }
            }
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now()+5) {
                    myText = "this is the new text"
                }
            })
            .onDisappear(perform: {
                myText = "ending text"
            })
            .navigationTitle("On appear : \(count)")
        }
    }
}

struct OnAppearDisappear_Previews: PreviewProvider {
    static var previews: some View {
        OnAppearDisappear()
    }
}
