//
//  SettingsViewController.swift
//  gmNews
//
//  Created by Faith Shatto on 4/6/19.
//  Copyright © 2019 Martin Landin. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onLogout(_ sender: Any) {
        self.performSegue(withIdentifier: "returnToLoginSegue", sender: nil)
        UserDefaults.standard.set(false, forKey: "userLoggedIn")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
