//
//  MyCartTableViewCell.swift
//  ECommeia
//
//  Created by HyperThink Systems on 03/08/17.
//  Copyright © 2017 HTS. All rights reserved.
//

import UIKit

class MyCartTableViewCell: UITableViewCell {
    
    @IBOutlet weak var itemImageView: UIImageView!
    
    @IBOutlet weak var itemNameLabel: UILabel!
    
    @IBOutlet weak var itemPriceLabel: UILabel!
    
    @IBOutlet weak var quantityLabel: UILabel!
    
    @IBOutlet weak var addToWishListButton: UIButton!
    
    @IBOutlet weak var removeFromCartListButton: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
    }
    
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
