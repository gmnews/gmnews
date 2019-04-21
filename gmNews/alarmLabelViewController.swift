//
//  alarmLabelViewController.swift
//  gmNews
//
//  Created by Martin Landin on 4/13/19.
//  Copyright © 2019 Martin Landin. All rights reserved.
//

import UIKit

class alarmLabelViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var alarmLabelTextField: UITextField!
    
    var delegate: LabelToAlarmDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        alarmLabelTextField.delegate = self
        
        alarmLabelTextField.returnKeyType = UIReturnKeyType.done
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        alarmLabelTextField.resignFirstResponder()
        delegate?.selectedLabel(label: alarmLabelTextField.text!)
        self.dismiss(animated: true, completion: nil)
        return false
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
