//
//  OnboardingView.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 17.02.2022.
//

import SwiftUI

struct OnboardingView: View {
    
    //Onboarding states:
    /*
     0 - welcome screen
     1 - add name
     2- add age
     3 - add gender
     */
    
    let transition: AnyTransition = .asymmetric(
        insertion: .move(edge: .trailing),
        removal: .move(edge: .leading))
    
    
    //onboarding inputs
    @State var onboardingState = 0
    @State var name = ""
    @State var age: Double = 18
    @State var gender: String = ""
    
    @State var alertTitle : String = ""
    @State var showAlert : Bool = false
    
    //app storage
    @AppStorage("name") var currentUserName : String?
    @AppStorage("age") var currentUserAge : Int?
    @AppStorage("gender") var currentUserGender : String?
    @AppStorage("signed_in") var currenUserSignedIn = false

    
    var body: some View {
        ZStack {
            
            //Color.purple
            // content
            
            ZStack {
                switch onboardingState {
                case 0 :
                    welcomeSection
                        .transition(transition)
                case 1 :
                    addNameSection
                        .transition(transition)
                case 2 :
                    addAgeSection
                        .transition(transition)
                case 3 :
                    addGenderSection
                        .transition(transition)
                default:
                    RoundedRectangle(cornerRadius: 25)
                        .foregroundColor(.green)
                }
            }
            
            //buttons
            VStack {
                Spacer()
                bottomButton
            }
            .padding(30)
        }
        .alert(isPresented: $showAlert) {
            return Alert(title: Text(alertTitle))
        }
    }
    
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}


//MARK: components

extension OnboardingView {
    
    private var bottomButton : some View {
        Text(onboardingState == 0 ? "Sign up" :
                onboardingState == 3 ? "Finish" :
                "Next")
            .font(.headline)
            .foregroundColor(.purple)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(.white)
            .cornerRadius(20)
            .animation(nil)
            .onTapGesture {
                handleNextButtonPressed()
            }
    }
    
    private var welcomeSection : some View {
        VStack(spacing: 40) {
            Spacer()
            Image(systemName: "heart.text.square.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .foregroundColor(.white)
            Text("Find your match")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .overlay(
                    Capsule(style: .continuous)
                        .frame(height: 3)
                        .offset(y: 5)
                        .foregroundColor(.white)
                    ,alignment: .bottom
                )
            Text("This is the #1 app for finding your match online! In thus tutorial we are precticing using AppStorage and other SwiftUI techniques.")
                .fontWeight(.medium)
                .foregroundColor(.white)
                
            Spacer()
            Spacer ()
        }
        .multilineTextAlignment(.center)
        .padding(30)
    }
    
    private var addNameSection : some View {
        VStack(spacing: 20) {
            Spacer()
            Text("What's your name?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            TextField("Yuor name here...", text: $name)
                .font(.headline)
                .frame(height: 55)
                .padding(.horizontal)
                .background(.white)
                .cornerRadius(25)
                
            
                
            Spacer()
            Spacer ()
        }
        .padding(30)
    }
    
    private var addAgeSection : some View {
        VStack(spacing: 20) {
            Spacer()
            Text("What's your age?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            
            Text("\(String(format: "%.0f", age))")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            
            Slider(value: $age, in: 18...100, step: 1)
                .accentColor(.white)
            
                
            Spacer()
            Spacer ()
        }
        .padding(30)
    }
    
    private var addGenderSection : some View {
        VStack(spacing: 20) {
            Spacer()
            Text("What's your gender?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            
            Text("Select a gender")
                .fontWeight(.semibold)
                .foregroundColor(.white)
                
            
            Picker(selection: $gender) {
                Text("Male").tag("Male")
                Text("Female").tag("Female")
                Text("Non-Binary").tag("Non-Binary")
            } label: {
                Text("Select a gender")
            }
            .accentColor(.purple)
            .pickerStyle(.menu)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(.white)
            .cornerRadius(25)

            
                
            Spacer()
            Spacer ()
        }
        .padding(30)
    }
}

//MARK: functions

extension OnboardingView {
    
    func handleNextButtonPressed() {
        //chek inputs
        switch onboardingState {
        case 1:
            guard name.count >= 3 else{
                showAlert(title: "Your name must be at least 3 characters long!")
                return
            }
        case 3:
            guard gender.count > 1 else {
                showAlert(title: "Pleese select a gender before moving forward")
                return
            }
        default:
            break
        }
        
        //go to next section
        if onboardingState == 3 {
            signIn()
        } else {
        withAnimation(.spring()) {
            onboardingState += 1
        }
        }
    }
    
    func signIn() {
        currentUserName = name
        currentUserAge = Int(age)
        currentUserGender = gender
        withAnimation(.spring()){
        currenUserSignedIn = true
        }
    }
    
    func showAlert(title: String) {
        alertTitle = title
        showAlert.toggle()
    }
}
