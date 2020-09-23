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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func submitButtonPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}
