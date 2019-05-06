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
    var selectedRow: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Connect data:
        self.countryPicker.delegate = self
        self.countryPicker.dataSource = self
        
        pickerData = [
            "US - United States",
            "AE - United Arab Emirates",
            "AR - Argentina",
            "AT - Austria",
            "AU - Australia",
            "BE - Belgium",
            "BG - Bulgaria",
            "BR - Brazil",
            "CA - Canada",
            "CH - Switzerland",
            "CN - China",
            "CO - Colombia",
            "CU - Cuba",
            "CZ - Czech Republic",
            "DE - Germany",
            "EG - Egypt",
            "FR - France",
            "GB - United Kingdom",
            "GR - Greece",
            "HK - Hong Kong",
            "HU - Hungary",
            "ID - Indonesia",
            "IE - Ireland",
            "IL - Israel",
            "IN - India",
            "IT - Italy",
            "JP - Japan",
            "KR - Korea",
            "LT - Lithuania",
            "LV - Latvia",
            "MA - Morocco",
            "MX - Mexico",
            "MY - Malaysia",
            "NG - Nigeria",
            "NL - Netherlands",
            "NO - Norway",
            "NZ - New Zealand",
            "PH - Philippines",
            "PL - Poland",
            "PT - Portugal",
            "RO - Romania",
            "RS - Serbia",
            "RU - Russia",
            "SA - Saudi Arabia",
            "SE - Sweden",
            "SG - Singapore",
            "SI - Slovenia",
            "SK - Slovakia",
            "TH - Thailand",
            "TR - Turkey",
            "TW - Taiwan",
            "UA - Ukraine",
            "VE - Venezuela",
            "ZA - South Africa"
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
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedRow = row
    }
    @IBAction func onSignUp(_ sender: Any) {
        var user = PFUser()
        user.username = usernameField.text
        user.password = passwordField.text
        user.email = emailField.text
        user["country"] = pickerData[selectedRow]
        
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
