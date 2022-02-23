//
//  DownloadJSON.swift
//  Bootcamp
//
//  Created by Сергей Иванчихин on 22.02.2022.
//

import SwiftUI

struct PostModel: Identifiable, Codable {
    let userId : Int
    let id : Int
    let title : String
    let body : String
}

class DownloadEscapingViewModel : ObservableObject {
    
    @Published var posts : [PostModel] = []
    
    init() {
        getPosts()
    }
    
    func getPosts() {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
        
        downloadData(fromURL: url) { returnedData in
            if let data = returnedData {
                guard let newPosts = try? JSONDecoder().decode([PostModel].self, from: data) else {return}
                DispatchQueue.main.async { [weak self] in
                    self?.posts = newPosts
                }
            } else {
                print("no data returned")
            }
        }
        
        
        
    }
    
    func downloadData(fromURL url: URL, handler: @escaping (_ data: Data?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, responce, error in
            guard
                let data = data,
                error == nil,
                let responce = responce as? HTTPURLResponse,
                responce.statusCode >= 200 && responce.statusCode < 300
            else {
                print("error dowload data")
                handler(nil)
                return
            }
            
            handler(data)
        }
        .resume()
    }
}


struct DownloadEscaping: View {
    
    @StateObject var vm = DownloadEscapingViewModel()
    
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

struct DownloadEscaping_Previews: PreviewProvider {
    static var previews: some View {
        DownloadEscaping()
    }
}
