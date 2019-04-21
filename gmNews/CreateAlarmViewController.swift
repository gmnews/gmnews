//
//  CreateAlarmViewController.swift
//  gmNews
//
//  Created by Martin Landin on 4/8/19.
//  Copyright © 2019 Martin Landin. All rights reserved.

import UIKit

class CreateAlarmViewController: UIViewController{
    
    @IBOutlet weak var timePicker: UIDatePicker!
    
    var weekdays = [Bool]()
    var alarmLabel:String?
    var alarmSound:String?
    
    var alarmTableViewController:AlarmTableViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let alarmController = childViewControllers.first as? AlarmTableViewController
        alarmTableViewController = alarmController
        alarmController?.delegate = self
    }
    
    
    

    @IBAction func onCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func onSave(_ sender: Any) {
        let date = timePicker.date
        print("Date is \(date)")
        let components = Calendar.current.dateComponents([.hour, .minute], from: date)
        print(components.hour!)
        print(components.minute!)
        //alarmTableViewController?.sendAlarmDetails()
        //print("Saved")
        //self.dismiss(animated: true, completion: nil)
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

extension CreateAlarmViewController: AlarmDetailsDelegate {
    func alarmDetails(repeatDays: [Bool], label: String, sound: String) {
        weekdays = repeatDays
        alarmLabel = label
        alarmSound = sound
        
        print("Sunday: \(weekdays[0])")
        print("Monday: \(weekdays[1])")
        print("Tuesday: \(weekdays[2])")
        print("Wednesday: \(weekdays[3])")
        print("Thursday: \(weekdays[4])")
        print("Friday: \(weekdays[5])")
        print("Saturday: \(weekdays[6])")
        
        print("Label is \(label)")
        
        print("Sound is \(alarmSound!)")
        
    }
    
    
}
