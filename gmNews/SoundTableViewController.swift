//
//  SoundTableViewController.swift
//  gmNews
//
//  Created by Martin Landin on 4/14/19.
//  Copyright © 2019 Martin Landin. All rights reserved.
//

import UIKit

class SoundTableViewController: UITableViewController {
    
    var delegate: SoundDelegate?
    
    let sounds = ["foghorn", "german-shephard", "doorbell", "submarine", "analog-watch", "school-bell"]
    
    var selected = ""
    
    var previous = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.allowsMultipleSelection = false
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCellAccessoryType.checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.checkmark
        }
        
        selected = sounds[indexPath.row]
        print(selected)
        
    }
    
    func sendSound() {
        delegate?.selectedSound(sound: selected)
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




