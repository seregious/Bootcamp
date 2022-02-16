//
//  CustomDataTypes.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 16.02.2022.
//

import SwiftUI

struct UserModel : Identifiable {
    let id: String = UUID().uuidString
    let displayName : String
    let userName : String
    let followerCount : Int
    let isVerified : Bool
}

struct Model_CustomData: View {
    
    @State var users : [UserModel] = [
    //"Nick", "Emely", "Samanta", "Chris"
        UserModel(displayName: "Nick", userName: "nick123", followerCount: 100, isVerified: true),
        UserModel(displayName: "Emely", userName: "itsemely", followerCount: 55, isVerified: false),
        UserModel(displayName: "Samanta", userName: "ninja", followerCount: 335, isVerified: false),
        UserModel(displayName: "Chris", userName: "chris2009", followerCount: 88, isVerified: true)
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(users) {user in
                    HStack(spacing: 15) {
                        Circle()
                            .frame(width: 35, height: 35)
                        VStack(alignment: .leading) {
                            Text(user.displayName)
                                .font(.headline)
                            Text("@\(user.userName)")
                                .foregroundColor(.gray)
                                .font(.caption)
                        }
                        
                        Spacer()
                        
                        if user.isVerified {
                        Image(systemName: "checkmark.seal.fill")
                            .foregroundColor(.blue)
                        }
                        
                        VStack{
                            Text("\(user.followerCount)")
                                .font(.headline)
                            Text("Followers")
                                .foregroundColor(.gray)
                                .font(.caption)
                        }
                    }
                    .padding(10)
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Users")
        }
    }
}

struct CustomDataTypes_Previews: PreviewProvider {
    static var previews: some View {
        Model_CustomData()
    }
}
