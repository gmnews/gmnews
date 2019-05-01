//
//  AlarmDetailsDelegate.swift
//  gmNews
//
//  Created by Martin Landin on 4/19/19.
//  Copyright © 2019 Martin Landin. All rights reserved.
//

protocol AlarmDetailsDelegate {
    func alarmDetails(repeatDays: [Bool], label:String, sound:String, selectedDays: String)
}
