//
//  selectWeekdaysViewController.swift
//  gmNews
//
//  Created by Martin Landin on 4/13/19.
//  Copyright © 2019 Martin Landin. All rights reserved.
//



import UIKit

class selectWeekdaysViewController: UIViewController {
    
    private var weekdayTableViewController: WeekdaysTableViewController?
    
    var weekdays = [Bool]()
    
    var delegate: WeekdayToAlarmTableDelegate?


    override func viewDidLoad() {
        super.viewDidLoad()
        
        let weekdayController = childViewControllers.first as? WeekdaysTableViewController
        
        weekdayTableViewController = weekdayController
        weekdayController?.delegate = self

    }
    

    @IBAction func onDone(_ sender: Any) {
        weekdayTableViewController?.sendDays()
        delegate?.selectedDays(days: weekdays)
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    
     //MARK: - Navigation

     //In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//         Get the new view controller using segue.destination.
//        Pass the selected object to the new view controller.
//        print("From Parent")
//    }
    

}

extension selectWeekdaysViewController: WeekdayDelegate {
    func weekdaysSelected(days: [Bool]) {
        weekdays = days
    }
}
