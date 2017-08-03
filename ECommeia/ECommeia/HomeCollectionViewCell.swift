//
//  HomeCollectionViewCell.swift
//  ECom
//
//  Created by HyperThink Systems on 28/07/17.
//  Copyright © 2017 HTS. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var itemNameLabel: UILabel!
    
    @IBOutlet weak var itemPriceLabel: UILabel!
    
    @IBOutlet weak var wishListButton: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        
        containerView.roundBorder(0.05)
        containerView.applyBorderColor(1.0, color: gray)

    }
    
    
    
    @IBAction func buttonActions(_ sender: UIButton) {
    }
    
    
    

}
