//
//  DownloadCombine.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 23.02.2022.
//

import SwiftUI

class DownloadCombineViewModel : ObservableObject {
    
    @Published var posts: [PostModel] = []
    
    init() {
        getPosts()
    }
    
    func getPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
        
        //1. create publisher
        //2. subscribe publisher on background thread (done by default)
        //3. recieve on main thread
        //4.try Map (check that data is good)
        
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap { data, responce in
                guard let responce = responce as? HTTPURLResponse,
                      responce >= 200 && responce < 300 else {
                          throw URLError(.)
                      }
            }
    }
}

struct DownloadCombine: View {
    
    @StateObject var vm = DownloadCombineViewModel()
    
    var body: some View {
        List {
            ForEach(vm.posts) {post in
                VStack {
                    Text(post.title)
                        .font(.headline)
                    Text(post.body)
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

struct DownloadCombine_Previews: PreviewProvider {
    static var previews: some View {
        DownloadCombine()
    }
}
