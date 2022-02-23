//
//  PublishersAndSubscribers.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 23.02.2022.
//

import SwiftUI
import Combine

class SubscriberViewModel: ObservableObject {
    
    @Published var count = 0
    var timer: AnyCancellable?
    
    init() {
        setUpTimer()
    }
    
    func setUpTimer() {
        timer = Timer
            .publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink {[weak self] _ in
                self?.count += 1
            }
    }
}

struct PublishersAndSubscribers: View {
    
    @State var vm = SubscriberViewModel()
    
    var body: some View {
        VStack {
            Text("\(vm.count)")
                .font(.largeTitle)
        }
       
    }
}

struct PublishersAndSubscribers_Previews: PreviewProvider {
    static var previews: some View {
        PublishersAndSubscribers()
    }
}
