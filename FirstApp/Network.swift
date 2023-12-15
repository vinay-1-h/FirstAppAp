//
//  Network.swift
//  FirstApp
//
//  Created by Vinay on 15/12/23.
//

import Foundation

class APIHandler {
    
    static var shared = APIHandler()
    
    func callAPI(completion: @escaping(Result<[WelcomeElement],Error> )-> Void) {

    let url = URL(string: "https://jsonplaceholder.typicode.com/posts/2/comments")
        let task = URLSession.shared.dataTask(with: url!) { data, res, err in
            if let data = data {
                let res = try? JSONDecoder().decode([WelcomeElement].self, from: data)
                completion(.success(res!))
            }
        }
        task.resume()
    }
}
