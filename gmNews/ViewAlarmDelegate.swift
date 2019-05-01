//
//  ViewAlarmDelegate.swift
//  gmNews
//
//  Created by Martin Landin on 4/24/19.
//  Copyright © 2019 Martin Landin. All rights reserved.
//

protocol ViewAlarmDelegate {
    func sendAlarmDetails(repeatDays: [Bool], label:String, sound:String)
}
