//
//  CreateAlarmViewController.swift
//  gmNews
//
//  Created by Martin Landin on 4/8/19.
//  Copyright © 2019 Martin Landin. All rights reserved.
//

import UIKit

class CreateAlarmViewController: UIViewController/*, UIPickerViewDelegate, UIPickerViewDataSource*/ {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    

    @IBAction func onCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func onSave(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
