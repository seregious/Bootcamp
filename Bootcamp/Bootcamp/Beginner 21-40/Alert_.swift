//
//  Alert_.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 13.02.2022.
//

import SwiftUI

struct Alert_: View {
    
    @State var showAlert = false
    @State var backgroundColor = Color.yellow
    @State var alertType : MyAlerts? = nil
    
    enum MyAlerts {
        case sucsess
        case error
    }
    
    var body: some View {
        ZStack {
            
            backgroundColor
            
            VStack {
                Button("Button 1") {
                    alertType = .error
                    showAlert.toggle()
                }
                
                Button("Button 2") {
                    alertType = .sucsess
                    showAlert.toggle()
                }
                
            }
            .alert(isPresented: $showAlert) {
                getAlert()
            }
        }
    }
    
    func getAlert() -> Alert {
        switch alertType {
        case .error :
            return Alert(title: Text("that was a error"))
        case .sucsess :
            return Alert(title: Text("that was a sucsess"))
        default :
            return Alert(title: Text("Error"))
        }
        
        
//        Alert(
//            title: Text(alertTitle),
//            message: Text(alertMessage),
//            dismissButton: .default(Text("OK")))
        
        //        Alert(
        //            title: Text("This was a error!"),
        //            message: Text("This was not fun"),
        //            primaryButton: .destructive(Text("Exterminate")) {
        //                backgroundColor = .red
        //            },
        //            secondaryButton: .cancel()
        //        )
    }
}

struct Alert__Previews: PreviewProvider {
    static var previews: some View {
        Alert_()
    }
}
