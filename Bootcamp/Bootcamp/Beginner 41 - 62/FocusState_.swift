//
//  FocusState_.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 17.02.2022.
//

import SwiftUI

struct FocusState_: View {
    
    enum OnboardingField : Hashable {
        case username
        case password
    }
    
    @FocusState private var fieldInFocus : OnboardingField?
    
    //@FocusState private var userNameInFocus : Bool
    //@FocusState private var passwordInFocus : Bool
    @State private var userName = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            
            TextField("Add your name here...", text: $userName)
                .focused($fieldInFocus, equals: .username)
                //.focused($userNameInFocus)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.gray.brightness(0.3))
                .cornerRadius(20)
            
            SecureField("Add your password here...", text: $password)
                .focused($fieldInFocus, equals: .password)
                //.focused($userNameInFocus)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.gray.brightness(0.3))
                .cornerRadius(20)
            
            Button("Sign up") {
                let userNameIsValid = !userName.isEmpty
                let passwordIsValid = !password.isEmpty
                
                if userNameIsValid && passwordIsValid {
                    print("sign up")
                } else if userNameIsValid {
                    fieldInFocus = .password
//                    userNameInFocus = false
//                    passwordInFocus = true
                } else {
                    fieldInFocus = .username
//                    userNameInFocus = true
//                    passwordInFocus = false
                }
            }
            
//            Button("Focus state change") {
//                userNameInFocus.toggle()
//            }
        }
        .padding()
//        .onAppear {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//                self.userNameInFocus = true
//            }
//        }
    }
}

struct FocusState__Previews: PreviewProvider {
    static var previews: some View {
        FocusState_()
    }
}
