//
//  Threads.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 20.02.2022.
//

import SwiftUI

class ThreadsViewModel : ObservableObject {
    
    @Published var dataAray : [String] = []
    
    func fetchData() {
        
        DispatchQueue.global(qos: .background).async {
            let newData = self.downloadData()
            
            print("Check 1: \(Thread.isMainThread)")
            print("Check 1: \(Thread.current)")

            
            DispatchQueue.main.async {
                self.dataAray = newData
                
                print("Check 2: \(Thread.isMainThread)")
                print("Check 2: \(Thread.current)")

            }
        }
        
    }
    
    private func downloadData() -> [String] {
        var data : [String] = []
        
        for x in 0..<100 {
            data.append("\(x)")
        }
        return data
    }
}

struct Threads: View {
    
    @StateObject var vm = ThreadsViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                Text("Load data")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .onTapGesture {
                        vm.fetchData()
                    }
                
                ForEach(vm.dataAray, id: \.self) {data in
                    Text(data)
                        .font(.headline)
                        .foregroundColor(.red)
                }
            }
        }
    }
}

struct Threads_Previews: PreviewProvider {
    static var previews: some View {
        Threads()
    }
}
