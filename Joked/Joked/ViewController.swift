//
//  ViewController.swift
//  Joked
//
//  Created by Ezra Black on 8/14/20.
//  Copyright © 2020 Casanova Studios. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {
    
    //MARK: - Outlets
    @IBOutlet weak var JokeViewLabel: UILabel!
    @IBOutlet weak var punchlineLabel: UILabel!
    @IBOutlet weak var nextJokeButton: UIButton!
    
    
    //MARK: - View Variables
    var networkingController = JokeController()
    
    ///Counts the amount of network calls the user has taken.
    var networkCount = 0

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.nextJokeButton.isHidden = true
        JokeViewLabel.layer.cornerRadius = 50
        punchlineLabel.layer.cornerRadius = 50
        nextJokeButton.layer.cornerRadius = 10
        
        JokeViewLabel.bloomAnimation()
        punchlineLabel.bloomAnimation()
        
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
    
    //MARK: - Actions
    
    @IBAction func handlePan(_ gesture: UIPanGestureRecognizer) {
      // 1
      let translation = gesture.translation(in: view)
    
      // 2
      guard let gestureView = gesture.view else {
        return
      }
      gestureView.center = CGPoint(
        x: gestureView.center.x + translation.x,
        y: gestureView.center.y + translation.y
      )
      // 3
      gesture.setTranslation(.zero, in: view)
    }
    
    func updateLabels() {
        networkingController.networkRequest {
            DispatchQueue.main.async {
                let joke = self.networkingController.joke[0].setup
                let punchline = self.networkingController.joke[0].punchline
                
                self.JokeViewLabel.moveInTransition(0.7)
                self.punchlineLabel.moveInTransition(0.7)
                
                self.JokeViewLabel.text = "\(punchline)"
                self.punchlineLabel.text = "\(joke)"
            }
        }
        
    }
    
    //MARK: - IB Actions

    @IBAction func favJokeButtonTapped(_ sender: Any) {
            //ask if user wishes to save joke
            //add joke to favorites list
            //display favorites collection view controller on seperate view
    }
    
    @IBAction func nextJokeTapped(_ sender: UIButton) {
        DispatchQueue.main.async {
            sender.pulsate()
        }
        updateLabels()
    }
    
}
