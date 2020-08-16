//
//  JokeNetworkingController.swift
//  Joked
//
//  Created by Ezra Black on 8/14/20.
//  Copyright © 2020 Casanova Studios. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

class JokeController {
    //MARK: - Properties -
    var baseURL = URL(string: "https://official-joke-api.appspot.com/random_joke")!
    var joke: [Joke] = []
    
    
    //MARK: - Networking -
    func networkRequest(completion: @escaping () -> Void ) {
        let urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        guard let requestURL = urlComponents?.url else {
            print("request URL is nil")
            completion()
            return
        }
        var request = URLRequest(url: requestURL)
        request.httpMethod = HTTPMethod.get.rawValue
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                print("Error fetching data: \(error)")
                return
            }
            guard let data = data else {
                print("No data returned from data Task")
                return
            }
            let jsonDecoder = JSONDecoder()
            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
            do {
                let jokeSearch = try jsonDecoder.decode(Joke.self, from: data)
                self.joke = [jokeSearch]
                print(" The result of the call to the API are as follows: \(jokeSearch)")
            } catch {
                print("Unable to decode data into object of type Joke: \(error)")
            }
            completion()
            print(data)
        }.resume()
    }
}
