//
//  ViewController.swift
//  Joked
//
//  Created by Ezra Black on 8/14/20.
//  Copyright © 2020 Casanova Studios. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var JokeViewLabel: UILabel!
    @IBOutlet weak var punchlineLabel: UILabel!
    @IBOutlet weak var nextJokeButton: UIButton!
    
    var networkingController = JokeController()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        JokeViewLabel.layer.cornerRadius = 50
        punchlineLabel.layer.cornerRadius = 50
        nextJokeButton.layer.cornerRadius = 10
        
        JokeViewLabel.backgroundColor = .lightGray
        punchlineLabel.backgroundColor = .lightGray
        
        // Do any additional setup after loading the view.
        networkingController.networkRequest {
            DispatchQueue.main.async {
                let joke = self.networkingController.joke[0].setup
                let punchline = self.networkingController.joke[0].punchline
                self.JokeViewLabel.text = "\(punchline)"
                self.punchlineLabel.text = "\(joke)"
            }
        }
    }
    
    func updateLabels() {
        networkingController.networkRequest {
            DispatchQueue.main.async {
                let joke = self.networkingController.joke[0].setup
                let punchline = self.networkingController.joke[0].punchline
//                self.JokeViewLabel.fadeTransition(0.7)
//                self.punchlineLabel.fadeTransition(0.7)
                self.JokeViewLabel.moveInTransition(0.7)
                self.punchlineLabel.moveInTransition(0.7)
                self.JokeViewLabel.text = "\(punchline)"
                self.punchlineLabel.text = "\(joke)"
            }
        }
    }

    @IBAction func favButtonTapped(_ sender: Any) {
    }
    @IBAction func favJokeButtonTapped(_ sender: Any) {
    }
    @IBAction func nextJokeTapped(_ sender: UIButton) {
        DispatchQueue.main.async {
            sender.pulsate()
        }
        updateLabels()
    }
    
}
