//
//  SideMenuDrawerTableViewCell.swift
//  ECommeia
//
//  Created by HyperThink Systems on 01/08/17.
//  Copyright © 2017 HTS. All rights reserved.
//

import UIKit

class SideMenuDrawerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var menuImageView: UIImageView!
    
    
    
    @IBOutlet weak var label: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
