
//
//  DealsTableViewCell.swift
//  Buzzed
//
//  Created by Alan Guerrero on 10/21/15.
//  Copyright © 2015 CS378. All rights reserved.
//

import UIKit

class DealsTableViewCell: UITableViewCell {
    
//    var dealDelegate:Deals?
    @IBOutlet var dealName: UILabel!
    @IBOutlet var dealPrice: UILabel!
    @IBOutlet var percentGood: UILabel!
    
//    @IBAction func badClick(sender: AnyObject) {
//        dealDelegate?.downvotes++
//    }
//    @IBAction func goodClick(sender: AnyObject) {
//        dealDelegate?.upvotes++
//        
//    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
