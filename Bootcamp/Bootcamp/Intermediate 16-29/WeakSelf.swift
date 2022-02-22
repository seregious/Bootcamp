//
//  WeakSelf.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 21.02.2022.
//

import SwiftUI

struct WeakSelf: View {
    
    @AppStorage("count") var count : Int?
    
    init() {
        count = 0
    }
    
    var body: some View {
        NavigationView {
            NavigationLink("Navigate") {
                WeakSelfSecondScreen()
                    .navigationTitle("Screen 1")
            }
            
        } .overlay(
            Text("\(count ?? 0)")
                .font(.largeTitle)
                .padding()
                .background(.green)
                .cornerRadius(10)
            , alignment: .topTrailing
            )
    }
}

struct WeakSelfSecondScreen : View {
    
    @StateObject var vm = WeakSelfSecondScreenViewModel()
    
    var body: some View {
        VStack {
            Text("Second View")
                .font(.largeTitle)
            .foregroundColor(.red)
            
            if let data = vm.data {
                Text(data)
            }
        }
    }
}

class WeakSelfSecondScreenViewModel : ObservableObject {
    @Published var data : String? = nil
    
    init() {
        print("initialize")
        let currenCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currenCount + 1, forKey: "count")
        getData()
    }
    
    deinit {
        let currenCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currenCount - 1, forKey: "count")
        print("deinitialize")
    }
    
    func getData() {
        

        
        DispatchQueue.main.asyncAfter(deadline: .now()+500) { [weak self] in
            self?.data = "New data!!!"

        }
    }
}

struct WeakSelf_Previews: PreviewProvider {
    static var previews: some View {
        WeakSelf()
    }
}
