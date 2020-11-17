//
//  FirebaseNetworkingController.swift
//  Joked
//
//  Created by Jesse Frederick on 9/25/20.
//  Copyright © 2020 Casanova Studios. All rights reserved.
//

import Foundation
import FirebaseDatabase

class NetworkController {
    
    //Adding a reference to our database
    let ref = Database.database().reference()
    var groupsRef: DatabaseReference
    let jokeRef: DatabaseReference
    var groups = [Group]()
    var jokes = [Joke]()
    
    init() {
        groupsRef = ref.child("groups")
        jokeRef = ref.child("jokes")
    }
    
    
    
    func createJoke(with setup: String, punchline: String, completion: @escaping () -> Void) {
            let newJoke = Joke(id: 1, type: "general", setup: setup, punchline: punchline)
            
        jokeRef.child((newJoke.setup)).setValue(newJoke.toDictionary())
            completion()
        }
    
}
