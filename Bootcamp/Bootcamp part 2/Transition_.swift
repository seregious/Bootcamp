//
//  Transition_.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 13.02.2022.
//

import SwiftUI

struct Transition_: View {
    
    @State var showView = false
    
    var body: some View {
        ZStack (alignment: .bottom) {
            
            VStack {
                Button("BUTTON") {
                    showView.toggle()
                }
                Spacer()
                
            }
            if showView {
                RoundedRectangle(cornerRadius: 20)
                    .frame(height: UIScreen.main.bounds.height * 0.5)
                    .transition(.asymmetric(
                        insertion: .slide,
                        removal: .move(edge: .leading)
                    ))
                    .animation(.easeInOut)
            }
            
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

struct Transition__Previews: PreviewProvider {
    static var previews: some View {
        Transition_()
    }
}
