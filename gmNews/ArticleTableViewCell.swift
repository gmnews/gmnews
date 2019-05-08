//
//  ArticleTableViewCell.swift
//  gmNews
//
//  Created by Gilbert Curbelo on 4/6/19.
//  Copyright © 2019 Martin Landin. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {

    
    @IBOutlet weak var sourceName: UILabel!
    @IBOutlet weak var articleText: UILabel!
    var url: String!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
