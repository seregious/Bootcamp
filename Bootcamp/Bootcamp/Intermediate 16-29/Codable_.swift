//
//  Codable_.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 21.02.2022.
//

import SwiftUI

struct CustomerModel : Identifiable {
    let id : String
    let name : String
    let points : Int
    let isPremium : Bool
}

class CodableViewModel : ObservableObject {
    @Published var customer : CustomerModel? = nil
    
    init () {
        getData()
    }
    
    func getData() {
        
        guard let data = getJSONData() else {return}
        print("JSON data:")
        print(data)
        
    }
    
    func getJSONData() -> Data? {
        
        let dictionary : [String : Any] = [
            "id" : "123435",
            "name" : "Joe",
            "points" : 5,
            "isPremium" : true
        ]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: <#T##Any#>, options: [])
        return jsonData
    }
}

struct Codable_: View {
    
    @StateObject var vm = CodableViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            if let customer = vm.customer {
                Text(customer.id)
                Text(customer.name)
                Text("\(customer.points)")
                Text(customer.isPremium.description)
            }
        }
    }
}

struct Codable__Previews: PreviewProvider {
    static var previews: some View {
        Codable_()
    }
}
