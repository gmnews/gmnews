//
//  LoginViewController.swift
//  gmNews
//
//  Created by Faith Shatto on 4/6/19.
//  Copyright © 2019 Martin Landin. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var wrongUsernameImage: UIImageView!
    @IBOutlet weak var wrongPasswordImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func usernameFieldChanged(_ sender: UITextField) {
        if (sender.text ?? "").isEmpty {
            wrongUsernameImage.isHidden = true
            wrongPasswordImage.isHidden = true
        }
    }
    @IBAction func passwordFieldChanged(_ sender: Any) {
    }
    
    @IBAction func onSignIn(_ sender: Any) {
        let username = usernameField.text!
        let password = passwordField.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
            if user != nil {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else if error != nil{
                self.wrongUsernameImage.isHidden = false
                self.wrongPasswordImage.isHidden = false
                print("Error: \(error?.localizedDescription)")
            }
        }
    }
    @IBAction func onSignUp(_ sender: Any) {
        var user = PFUser()
        user.username = usernameField.text
        user.password = passwordField.text
        
        user.signUpInBackground{ (success, error) in
            if success {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                print("Error: \(error?.localizedDescription)")
            }
        }
    }
}
