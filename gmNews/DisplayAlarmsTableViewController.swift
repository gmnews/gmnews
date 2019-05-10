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
        
        navigationController?.navigationBar.barStyle = .black
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        setAlarms.removeAll()
        
        let alarms = UserDefaults.standard.dictionary(forKey: "Alarms") as? [String : [String]] ?? [String: [String]]()
        
        for (key, value) in alarms {
            setAlarms.append(value)
        }
        tableView.reloadData()
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let cell = tableView.cellForRow(at: indexPath) as! AlarmTableViewCell
            let alarmIdentifier = cell.alarmNameLabel.text!
            
            var alarmsSet = UserDefaults.standard.dictionary(forKey: "Alarms") as? [String: [String]] ?? [String : [String]]()
            alarmsSet.removeValue(forKey: alarmIdentifier)
            
            setAlarms.removeAll()
            for (key, value) in alarmsSet {
                setAlarms.append(value)
            }
            
            UserDefaults.standard.set(setAlarms, forKey: "Alarms")
            
            let center = UNUserNotificationCenter.current()
            center.removeDeliveredNotifications(withIdentifiers: [alarmIdentifier])
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
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
