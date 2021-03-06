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
    
    func showEditName() {
        //Creating UIAlertController and
        //Setting title and message for the alert dialog
        let alertController = UIAlertController(title: "Edit name", message: nil, preferredStyle: .alert)
        
        //the confirm action taking the inputs
        let confirmAction = UIAlertAction(title: "Done", style: .default) { (_) in
            
            //getting the input values from user
            let newName = alertController.textFields?[0].text
            
            PFUser.current()?["name"] = newName
            PFUser.current()?.saveInBackground()
            self.nameLabel.text = newName
        }
        
        //the cancel action doing nothing
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        
        //adding textfields to our dialog box
        alertController.addTextField { (textField) in
            textField.placeholder = "Enter Name"
        }
        
        //adding the action to dialogbox
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        //finally presenting the dialog box
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func onEditName(_ sender: Any) {
        showEditName()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barStyle = .black
        
        // Retrieve user info from parse database
        let name = PFUser.current()?.object(forKey: "name") as? String
        let username = PFUser.current()?.username
        let country = PFUser.current()?.object(forKey: "country") as? String
        let email = PFUser.current()?.email
        
        // Set labels on UI to retrieved user info
        if(name == nil) {
            nameLabel.text = username
        } else {
            nameLabel.text = name
        }
        
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
