//
//  Escaping.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 21.02.2022.
//

import SwiftUI

class EscapingViewModel : ObservableObject {
    @Published var text : String = "Hello"
    
    func getData() {
        downloadData5 { [weak self] returnedResult in
            self?.text = returnedResult.data
        }
        
        
//        downloadData3 { [weak self] data in
//            self?.text = data
//        }
    }
    
    func downloadData() -> String {
        return "New data"
    }
    
    func downloadData2(handler: (_ data: String) -> ())  {
        handler("New data lol")
    }
    
    func downloadData3(handler: @escaping (_ data: String) -> ())  {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            handler("New data lol")
        }
    }
    
    func downloadData4(handler: @escaping (DownloadResult) -> ())  {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let result = DownloadResult(data: "Newest data!!!")
            handler(result)
        }
    }
    
    func downloadData5(handler: @escaping DownloadComplition)  {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let result = DownloadResult(data: "Newest data!!!")
            handler(result)
        }
    }
}

struct DownloadResult {
    let data : String
}

typealias DownloadComplition = (DownloadResult) -> ()


struct Escaping: View {
    
    @StateObject var vm = EscapingViewModel()
    
    var body: some View {
        Text(vm.text)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundColor(.blue)
            .onTapGesture {
                vm.getData()
            }
    }
}

struct Escaping_Previews: PreviewProvider {
    static var previews: some View {
        Escaping()
    }
}
