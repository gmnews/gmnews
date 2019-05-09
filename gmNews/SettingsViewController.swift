//
//  SettingsViewController.swift
//  gmNews
//
//  Created by Faith Shatto on 4/6/19.
//  Copyright © 2019 Martin Landin. All rights reserved.
//

import UIKit
import Parse

class SettingsViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Retrieve user info from parse database
        let name = PFUser.current()?.object(forKey: "name") as? String
        let username = PFUser.current()?.username
        let country = PFUser.current()?.object(forKey: "country") as? String
        let email = PFUser.current()?.email
        
        // Set labels on UI to retrieved user info
        usernameLabel.text = username
        countryLabel.text = country
        emailLabel.text = email
    }
    
    @IBAction func onEdit(_ sender: Any) {
        self.performSegue(withIdentifier: "settingsToSources", sender: nil)
    }
    
    @IBAction func onLogout(_ sender: Any) {
        self.performSegue(withIdentifier: "returnToLoginSegue", sender: nil)
        UserDefaults.standard.set(false, forKey: "userLoggedIn")
    }
}
