//
//  NewsSourceTableViewCell.swift
//  gmNews
//
//  Created by Gilbert Curbelo on 5/9/19.
//  Copyright © 2019 Martin Landin. All rights reserved.
//

import UIKit

class NewsSourceTableViewCell: UITableViewCell {

    @IBOutlet weak var sourceName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
