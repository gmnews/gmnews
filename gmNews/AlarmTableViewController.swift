//
//  AlarmTableViewController.swift
//  gmNews
//
//  Created by Martin Landin on 4/10/19.
//  Copyright © 2019 Martin Landin. All rights reserved.
//

import UIKit

class AlarmTableViewController: UITableViewController {

    var weekdays = [Bool]()
    var alarmLabel:String?
    var alarmSound:String?
    var selectedDaysString = ""
    
    var delegate:AlarmDetailsDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.isScrollEnabled = false
        
    }
    
    func sendAlarmDetails() {
        delegate?.alarmDetails(repeatDays: weekdays, label: alarmLabel!, sound: alarmSound!, selectedDays: selectedDaysString)
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if(segue.identifier! == "CreateAlarmToRepeat") {
            let repeatViewController = segue.destination as! selectWeekdaysViewController
            repeatViewController.delegate = self
        }
        
        if(segue.identifier! == "CreateAlarmToLabel") {
            let labelController = segue.destination as! alarmLabelViewController
            labelController.delegate = self
        }
        
        if(segue.identifier! == "CreateAlarmToSound") {
            let soundController = segue.destination as! SelectSoundViewController
            soundController.delegate = self
        }
    }
 
}

extension AlarmTableViewController: WeekdayToAlarmTableDelegate {
    
    func selectedDays(days: [Bool], selectedDays: String) {
        selectedDaysString = selectedDays
        weekdays = days
    }
}

extension AlarmTableViewController: LabelToAlarmDelegate {
    func selectedLabel(label: String) {
        alarmLabel = label
    }
    
    
}

extension AlarmTableViewController: SoundToAlarmTableDelegate {
    func sendSound(sound: String) {
        alarmSound = sound
    }
}
