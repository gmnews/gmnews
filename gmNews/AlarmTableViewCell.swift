//
//  AlarmTableViewCell.swift
//  gmNews
//
//  Created by Martin Landin on 4/22/19.
//  Copyright © 2019 Martin Landin. All rights reserved.
//

import UIKit

class AlarmTableViewCell: UITableViewCell {

    @IBOutlet weak var alarmNameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var amPmLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
