//
//  SignUpViewController.swift
//  gmNews
//
//  Created by Faith Shatto on 4/15/19.
//  Copyright © 2019 Martin Landin. All rights reserved.
//

import UIKit
import Parse

class SignUpViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var countryPicker: UIPickerView!
    
    var pickerData: [String] = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Connect data:
        self.countryPicker.delegate = self
        self.countryPicker.dataSource = self
        
        pickerData = [
            "United Arab Emirates",
            "Argentina",
            "Austria",
            "Australia",
            "Belgium",
            "Bulgaria",
            "Brazil",
            "Canada",
            "Switzerland",
            "China",
            "Colombia",
            "Cuba",
            "Czech Republic",
            "Germany",
            "Egypt",
            "France",
            "United Kingdom",
            "Greece",
            "Hong Kong",
            "Hungary",
            "Indonesia",
            "Ireland",
            "Israel",
            "India",
            "Italy",
            "Japan",
            "Korea",
            "Lithuania",
            "Latvia",
            "Morocco",
            "Mexico",
            "Malaysia",
            "Nigeria",
            "Netherlands",
            "Norway",
            "New Zealand",
            "Philippines",
            "Poland",
            "Portugal",
            "Romania",
            "Serbia",
            "Russia",
            "Saudi Arabia",
            "Sweden",
            "Singapore",
            "Slovenia",
            "Slovakia",
            "Thailand",
            "Turkey",
            "Taiwan",
            "Ukraine",
            "United States",
            "Venezuela",
            "South Africa"
        ]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    @IBAction func onSignUp(_ sender: Any) {
        var user = PFUser()
        user.username = usernameField.text
        user.password = passwordField.text
        user.email = emailField.text
        
        user.signUpInBackground{ (success, error) in
            if success {
                self.performSegue(withIdentifier: "SignUpToSourcesSegue", sender: nil)
            } else {
                print("Error: \(error?.localizedDescription)")
            }
        }
    }
    
    @IBAction func onCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
