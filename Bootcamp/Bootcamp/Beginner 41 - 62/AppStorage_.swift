//
//  AppStorage.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 17.02.2022.
//

import SwiftUI

struct AppStorage_: View {
    
    //@State var currentUserName : String?
    @AppStorage("name") var currentUserName : String?
    
    var body: some View {
        VStack(spacing: 20) {
            Text(currentUserName ?? "add name here")
            
            if let name = currentUserName {
                Text(name)
            }
            
            Button("save") {
                let name = "Nick"
              currentUserName = name
//                UserDefaults.standard.set(name, forKey: "name")
            }
        }
//        .onAppear {
//            currentUserName = UserDefaults.standard.string(forKey: "name")
        }
    }


struct AppStorage_Previews: PreviewProvider {
    static var previews: some View {
        AppStorage_()
    }
}
