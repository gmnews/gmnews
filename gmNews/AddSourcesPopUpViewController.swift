//
//  AddSourcesPopUpViewController.swift
//  gmNews
//
//  Created by Faith Shatto on 4/15/19.
//  Copyright © 2019 Martin Landin. All rights reserved.
//

import UIKit

class AddSourcesPopUpViewController: UIViewController {

    @IBAction func onSkip(_ sender: Any) {
        self.performSegue(withIdentifier: "SourcesToHomeSegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
