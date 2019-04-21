//
//  SelectSoundViewController.swift
//  gmNews
//
//  Created by Martin Landin on 4/13/19.
//  Copyright © 2019 Martin Landin. All rights reserved.
//

import UIKit

class SelectSoundViewController: UIViewController {
    
    var delegate:SoundToAlarmTableDelegate?
    
    var alarmSound: String?
    private var soundTableViewController: SoundTableViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let soundController = childViewControllers.first as? SoundTableViewController
        soundTableViewController = soundController
        soundController?.delegate = self
    }
    

    @IBAction func onDone(_ sender: Any) {
        soundTableViewController?.sendSound()
        delegate?.sendSound(sound: alarmSound!)
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

extension SelectSoundViewController: SoundDelegate {
    func selectedSound(sound: String) {
        alarmSound = sound
    }
    
    
}
