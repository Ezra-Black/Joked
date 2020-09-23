//
//  JokeModel.swift
//  Joked
//
//  Created by Ezra Black on 8/14/20.
//  Copyright © 2020 Casanova Studios. All rights reserved.
//

import Foundation
import Firebase


struct Joke: Codable, Hashable {
    let id: Int
    let type: String
    let setup: String
    let punchline: String
}
struct JokeSearch: Codable {
       let results: Joke
   }
