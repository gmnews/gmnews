//
//  WeekdaysTableViewController.swift
//  gmNews
//
//  Created by Martin Landin on 4/11/19.
//  Copyright © 2019 Martin Landin. All rights reserved.
//

import UIKit

class WeekdaysTableViewController: UITableViewController {
    
    var delegate: WeekdayDelegate?
    
    var daysChecked: Array<Bool> = Array(repeating: false, count: 7) //Days start at Sunday

    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCellAccessoryType.checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.none
            daysChecked[indexPath.row] = false
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.checkmark
            daysChecked[indexPath.row] = true
        }
        
    }
    
    
    func sendDays() {
        delegate?.weekdaysSelected(days: daysChecked)
    }
    
    
    
//     MARK: - Navigation
//
//     //In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
    

}
