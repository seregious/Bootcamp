//
//  SortFilterMap.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 19.02.2022.
//

import SwiftUI

struct userModel: Identifiable {
    let id = UUID().uuidString
    let name : String
    let points : Int
    let isVerified : Bool
}

class ArrayModificationViewModel : ObservableObject {
    
    @Published var dataArray: [userModel] = []
    @Published var filteredArray : [userModel] = []
    @Published var mappedArray : [String] = []
    
    init() {
        getUsers()
        udateFilteredArray()
    }
    
    func udateFilteredArray() {
        
        //sort
        //filteredArray = dataArray.sorted {$0.points > $1.points}
        
        //filter
        //filteredArray = dataArray.filter({ $0.isVerified})
        
        //map
        //mappedArray = dataArray.map({$0.name})
        //mappedArray = dataArray.compactMap({$0.name}) - if there is optional
        
        mappedArray = dataArray
            .sorted {$0.points > $1.points}
            .filter({ $0.isVerified})
            .compactMap({$0.name})
    }
    
    func getUsers() {
        let user1 = userModel(name: "Nick", points: 5, isVerified: true)
        let user2 = userModel(name: "Chris", points: 0, isVerified: false)
        let user3 = userModel(name: "Joe", points: 20, isVerified: true)
        let user4 = userModel(name: "Emily", points: 50, isVerified: false)
        let user5 = userModel(name: "Samantha", points: 45, isVerified: true)
        let user6 = userModel(name: "Jason", points: 23, isVerified: false)
        let user7 = userModel(name: "Sarah", points: 76, isVerified: true)
        let user8 = userModel(name: "Lisa", points: 45, isVerified: false)
        let user9 = userModel(name: "Steve", points: 1, isVerified: true)
        let user10 = userModel(name: "Amanda", points: 100, isVerified: false)
        self.dataArray.append(contentsOf: [user1, user2, user3, user4, user5, user6, user7, user8, user9, user10])
    }
}

struct SortFilterMap: View {
    
    @StateObject var vm = ArrayModificationViewModel()
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                //loop for map
                ForEach(vm.mappedArray, id: \.self) {name in
                    Text(name)
                        .font(.title)
                }
                
                
                
                // loop for sort and filter
                
//                ForEach(vm.filteredArray) {user in
//                    VStack(alignment: .leading){
//                        Text(user.name)
//                            .font(.headline)
//                        HStack {
//                            Text("Points : \(user.points)")
//                            Spacer()
//                            if user.isVerified {
//                                Image(systemName: "flame.fill")
//                            }
//                        }
//                    }
//                    .foregroundColor(.white)
//                    .padding()
//                    .background(.blue)
//                    .cornerRadius(25)
//                    .padding(.horizontal)
//                }
            }
        }
    }
}

struct SortFilterMap_Previews: PreviewProvider {
    static var previews: some View {
        SortFilterMap()
    }
}
