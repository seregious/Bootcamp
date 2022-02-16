//
//  Documentation.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 15.02.2022.
//

import SwiftUI

struct Documentation: View {
    
    //MARK: properties
    
    @State var data = ["apples", "oranges", "bananas"]
    @State var showAlert = false
    
    //MARK: body
    
    /*working copy - things to do:
     1) fix title
     2) fix alert
     3) fix something
     */
    
    var body: some View {
        NavigationView {  // START NAV
            ZStack {
                
                //background
                Color.red
                
                //foreground
                ScrollView { // START SCROLL
            
                    Text("Hello")
                    ForEach(data, id: \.self) {fruit in
                        Text(fruit)
                            .font(.headline)
                    }
                } // END SCROLL
                .navigationTitle("Documentation")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Allert") {
                            showAlert.toggle()
                        }
                    }
                }
                .alert(isPresented: $showAlert) {
                    getAlert(text: "this is a alert")
            }
            }
        } //END NAV
    }
    
    //MARK: functions
    
    /// Gets an alert with something
    ///
    ///this function creates and returns. the alert will have title based on the text parametr but it will not have a massage
    ///
    ///```
    ///getAlert(text: "Hi") -> Alert(title: Text("Hi"))
    ///```
    /// - Warning: there is no massage
    /// - Parameter text: this this the title of alert
    /// - Returns: return an alert with a title
    func getAlert(text: String) -> Alert {
        return Alert(title: Text(text))
    }
}

// MARK: preview

struct Documentation_Previews: PreviewProvider {
    static var previews: some View {
        Documentation()
    }
}
