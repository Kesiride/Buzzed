//
//  BarTableViewCell.swift
//  Buzzed
//
//  Created by Alan Guerrero on 10/21/15.
//  Copyright © 2015 CS378. All rights reserved.
//

import UIKit

class BarTableViewCell: UITableViewCell {
    
    @IBOutlet var barName: UILabel!
    @IBOutlet var totalDeals: UILabel!
    @IBOutlet var distance: UILabel!
    
    @IBOutlet var pic: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
