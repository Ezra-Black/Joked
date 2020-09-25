//
//  SubmitAJokeView.swift
//  Joked
//
//  Created by Ezra Black on 9/22/20.
//  Copyright © 2020 Casanova Studios. All rights reserved.
//

import UIKit

class SubmitAJokeView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    
    @IBAction func submitButtonPressed(_ sender: Any) {
        #warning("should send network request")
        self.dismiss(animated: true)
    }
    
}
