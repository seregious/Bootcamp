//
//  DownloadCombine.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 23.02.2022.
//

import SwiftUI
import Combine

class DownloadCombineViewModel : ObservableObject {
    
    @Published var posts: [PostModel] = []
    var cancellables = Set<AnyCancellable>()
    
    init() {
        getPosts()
    }
    
    func getPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
        
        //1. create publisher
        //2. subscribe publisher on background thread (done by default)
        //3. recieve on main thread
        //4. try Map (check that data is good)
        //5. decode (decode data into PostModel)
        //6. sink (put item into our app)
        //7. store
        
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: [PostModel].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .sink { [weak self] (returnedPosts) in
                self?.posts = returnedPosts
            }
            .store(in: &cancellables)

    }
    
    func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data{
        guard
            let responce = output.response as? HTTPURLResponse,
            responce.statusCode >= 200 && responce.statusCode < 300 else {
                  throw URLError(.badServerResponse)
              }
        return output.data
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
