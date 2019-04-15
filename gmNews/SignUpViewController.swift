//
//  SignUpViewController.swift
//  gmNews
//
//  Created by Faith Shatto on 4/15/19.
//  Copyright © 2019 Martin Landin. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        <#code#>
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        <#code#>
    }
    

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var countryPicker: UIPickerView!
    
    var pickerData: [String] = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Connect data:
        self.picker.delegate = self
        self.picker.dataSource = self
        
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
    
    // Number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -&gt; Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -&gt; Int {
        return pickerData.count
    }
    
    // The data to return fopr the row and component (column) that's being passed in
    private func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -&gt; String? {
        return pickerData[row]
    }

}
