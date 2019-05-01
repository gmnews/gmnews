//
//  DisplayAlarmsTableViewController.swift
//  gmNews
//
//  Created by Martin Landin on 4/22/19.
//  Copyright © 2019 Martin Landin. All rights reserved.
//

import UIKit
import UserNotifications

class DisplayAlarmsTableViewController: UITableViewController {
    
    var alarms = [UNNotificationRequest]()
    
    var setAlarms = [[String]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let alarms = UserDefaults.standard.dictionary(forKey: "Alarms") as? [String : [String]] ?? [String: [String]]()
        
        for (key, value) in alarms {
            setAlarms.append(value)
        }
        
        tableView.tableFooterView = UIView()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return setAlarms.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 98.0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlarmCell", for: indexPath) as! AlarmTableViewCell
        
        cell.alarmNameLabel.text = setAlarms[indexPath.row][0]
        cell.dayLabel.text = setAlarms[indexPath.row][1]
        cell.timeLabel.text = setAlarms[indexPath.row][2]
        cell.amPmLabel.text = setAlarms[indexPath.row][3]

        return cell
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
