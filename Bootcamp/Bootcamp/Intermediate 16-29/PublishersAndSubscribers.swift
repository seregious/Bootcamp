//
//  PublishersAndSubscribers.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 23.02.2022.
//

import SwiftUI
import Combine

class SubscriberViewModel: ObservableObject {
    
    @Published var count: Int = 0
    @Published var text = ""
    @Published var textIsValid = false
    var cancellables = Set<AnyCancellable>()
    
    init() {
        setUpTimer()
        addTextFieldSubriber()
    }
    
    func addTextFieldSubriber() {
        $text
            .map { (text) -> Bool in
                if text.count > 3 {
                    return true
                }
                return false
            }
            //.assign(to: \.textIsValid, on: self)
            .sink(receiveValue: { [weak self] (isValid) in
                self?.textIsValid = isValid
            })
            .store(in: &cancellables)
    }
    
    func setUpTimer() {
        Timer
            .publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self = self else {return}
                self.count += 1
                
            }
            .store(in: &cancellables)
    }
}

struct PublishersAndSubscribers: View {
    
    @State var vm = SubscriberViewModel()
    
    var body: some View {
        VStack {
            Text("\(vm.count)")
                .font(.largeTitle)
            
            TextField("Type something here", text: $vm.text)
                .frame(height: 55)
                .font(.headline)
                .background(.gray.opacity(0.3))
                .cornerRadius(25)
        }
        .padding()
    }
}

struct PublishersAndSubscribers_Previews: PreviewProvider {
    static var previews: some View {
        PublishersAndSubscribers()
    }
}
