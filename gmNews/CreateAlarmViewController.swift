//
//  CreateAlarmViewController.swift
//  gmNews
//
//  Created by Martin Landin on 4/8/19.
//  Copyright © 2019 Martin Landin. All rights reserved.

import UIKit
import UserNotifications

class CreateAlarmViewController: UIViewController{
    
    @IBOutlet weak var timePicker: UIDatePicker!
    
    var weekdays = [Bool]()
    var alarmLabel:String?
    var alarmSound:String?
    var selectedDaysString = ""
    
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
        alarmTableViewController?.sendAlarmDetails()
        
        
        let date = timePicker.date
        let components = Calendar.current.dateComponents([.hour, .minute], from: date)
        
        let center = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        
        content.title = alarmLabel!
        content.sound = UNNotificationSound.default()
        content.threadIdentifier = alarmLabel!
        
        
        var dayCounter = 1
        
        for day in weekdays {
            if(day) {
                let alarmComponent = DateComponents(hour: components.hour, minute: components.minute, weekday: dayCounter)
                
                let trigger = UNCalendarNotificationTrigger(dateMatching: alarmComponent, repeats: true)
                
                let request = UNNotificationRequest(identifier: alarmLabel!, content: content, trigger: trigger)
                
//                center.add(request) { (error) in
//                    if error != nil {
//                        print(error!)
//                    }
//                }
                
            }
            dayCounter += 1
        }
        
        var hour = components.hour!
        let minutes = components.minute!
        var ampm = ""
        
        if(hour > 12) {
            hour -= 12
            ampm = "PM"
        } else {
            ampm = "AM"
        }
        
        let hourString = String(format: "%02d:%02d", hour, minutes)
        
        if var setAlarms = UserDefaults.standard.dictionary(forKey: "Alarms") {
            let alarmDetails = [alarmLabel!, selectedDaysString, hourString, ampm]
            setAlarms[alarmLabel!] = alarmDetails
            UserDefaults.standard.set(setAlarms, forKey: "Alarms")
        } else {
            var setAlarms = [String: [String]]()
            let alarmDetails = [alarmLabel!, selectedDaysString, hourString, ampm]
            setAlarms[alarmLabel!] = alarmDetails
            UserDefaults.standard.set(setAlarms, forKey: "Alarms")
        }
        
        print("Alarm Created")
        
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

extension CreateAlarmViewController: AlarmDetailsDelegate {
    
    func alarmDetails(repeatDays: [Bool], label: String, sound: String, selectedDays: String) {
        weekdays = repeatDays
        alarmLabel = label
        alarmSound = sound
        selectedDaysString = selectedDays
        
    }
    
}
