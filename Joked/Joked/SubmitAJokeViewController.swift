//
//  SubmitAJokeViewController.swift
//  Joked
//
//  Created by Ezra Black on 9/25/20.
//  Copyright © 2020 Casanova Studios. All rights reserved.
//

import UIKit

class SubmitAJokeViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var jokeTextField: UITextField!
    @IBOutlet weak var punchlineTextField: UITextField!
    
//    var pickerData: [String] = [String]()
    var controller = NetworkController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        pickerData = ["general"]
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            view.endEditing(true)
        }
    
    override func didReceiveMemoryWarning() {
         super.didReceiveMemoryWarning()
         // Dispose of any resources that can be recreated.
     }

     // Number of columns of data
//     func numberOfComponents(in pickerView: UIPickerView) -> Int {
//         return 1
//     }
     
     // The number of rows of data
//     func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//         return pickerData.count
//     }
     
     // The data to return for the row and component (column) that's being passed in
//     func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//         return pickerData[row]
//     }
    
    // Capture the picker view selection
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        // This method is triggered whenever the user makes a change to the picker selection.
//        // The parameter named row and component represents what was selected.
//    }

    @IBAction func submitButtonPressed(_ sender: Any) {
        showAlert()
        #warning("SEND firebase joke to database!")
        controller.createJoke(with: jokeTextField.text ?? "", punchline: punchlineTextField.text ?? "") {
            print("The joke was submitted successfully: \(self.jokeTextField.text), \(self.punchlineTextField.text)")
        }
    }
    
    func showAlert(){
        let alert = UIAlertController(title: "Submission Recieved!", message: "Thank you! If your Joke is approved it will be added to the official list!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
            self.dismiss(animated: true)
            #warning("network call here?")
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { _ in
            alert.dismiss(animated: true)
        }))
        present(alert, animated: true)
    }
}
