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
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "userLoggedIn") == true {
            self.performSegue(withIdentifier: "loginSegue", sender: self)
        }
    }
    
    @IBAction func usernameFieldChanged(_ sender: UITextField) {
        if (sender.text ?? "").isEmpty {
            wrongUsernameImage.isHidden = true
            wrongPasswordImage.isHidden = true
        }
    }
    @IBAction func passwordFieldChanged(_ sender: Any) {
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func onSignIn(_ sender: Any) {
        let username = usernameField.text!
        let password = passwordField.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
            if user != nil {
                UserDefaults.standard.set(true, forKey: "userLoggedIn")
                self.performSegue(withIdentifier: "loginSegue", sender: self)
            } else if error != nil{
                self.wrongUsernameImage.isHidden = false
                self.wrongPasswordImage.isHidden = false
                print("Error: \(error?.localizedDescription)")
            }
        }
    }
    @IBAction func onSignUp(_ sender: Any) {
        self.performSegue(withIdentifier: "SignInToSignUpSegue", sender: nil)
    }
    
}
