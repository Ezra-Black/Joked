//
//  Groups.swift
//  Joked
//
//  Created by Jesse Frederick on 9/25/20.
//  Copyright © 2020 Casanova Studios. All rights reserved.
//

import Foundation
import FirebaseDatabase

#warning("Group file set up for Firebase")

struct Group {
    let id: UUID
    let joke: String
    let punchline: String

    init(id: UUID = UUID(), joke: String, punchline: String) {
        self.id = id
        self.joke = joke
        self.punchline = punchline
    }

    init?(snapshot: DataSnapshot) {
        guard
            let value = snapshot.value as? [String: AnyObject],
            let joke = value["joke"] as? String,
            let punchline = value["punchline"] as? String else {
                return nil
        }
        self.id = UUID(uuidString: snapshot.key) ?? UUID()
        self.joke = joke
        self.punchline = punchline
    }

    func toDictionary() -> Any {
        return [
            "joke": joke,
            "punchline": punchline
        ]
    }
}
