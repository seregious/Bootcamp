//
//  IfLetGuard.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 16.02.2022.
//

import SwiftUI

struct IfLetGuard: View {
    
    @State var currentUserID : String? = "TestUser"
    @State var displayText : String? = nil
    @State var isLoading = false
    
    var body: some View {
        NavigationView {
            VStack {
                
                Text("Save code practice")
                
                if let text = displayText{
                    Text(text)
                        .font(.title)
                }
                
                if isLoading {
                    ProgressView()
                }
                
                Spacer()
            }
            .navigationTitle("Save coding")
            .onAppear {
                loadDataGuard()
            }
        }
    }
    
    func loadData() {
        
        if let userID = currentUserID {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now()+3) {
            displayText = "This is new text for \(userID)"
            isLoading = false
        }
        } else {
            displayText = "error, there is no user id"
        }
    }
    
    func loadDataGuard() {
        guard let userID = currentUserID else {
            displayText = "error, there is no user id"
            return
        }
        
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now()+3) {
            displayText = "This is new text for \(userID)"
            isLoading = false
        }
    }
}

struct IfLetGuard_Previews: PreviewProvider {
    static var previews: some View {
        IfLetGuard()
    }
}
