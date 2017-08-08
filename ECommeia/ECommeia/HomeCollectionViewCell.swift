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
    
    var first : FirstViewController! = FirstViewController()
   
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        
        containerView.roundBorder(0.05)
        containerView.applyBorderColor(1.0, color: gray)
        
        wishListButton.tag = 1
        
    }
    
    
    
    
    
    
    func addToWishList(_ sender: UIButton){
        
        let buttnPositn : CGPoint = sender.convert(CGPoint.zero, to: first.foodCollectionView)
        let indexPath : NSIndexPath = first.foodCollectionView.indexPathForItem(at: buttnPositn)! as NSIndexPath
        
        wishListDictionary = ["ItemName" : "\(itemNameArray[indexPath.row])" , "ItemPrice" : "\(itemPriceArray[indexPath.row])"]
        print(wishListDictionary)
        
        wishListArray.append((wishListDictionary as NSDictionary) as! [String : String])
        print(wishListArray)
    }
    
    func removeFromWishList(_ sender: UIButton){
        
        let buttnPositn : CGPoint = sender.convert(CGPoint.zero, to: first.foodCollectionView)
        let indexPath2 : NSIndexPath = first.foodCollectionView.indexPathForItem(at: buttnPositn)! as NSIndexPath
        
        wishListArray.remove(at: indexPath2.row)
        print(wishListArray)
    }


    
    
    @IBAction func buttonActions(_ sender: UIButton) {
        if wishListButton.tag == 1{
            addToWishList(wishListButton)
            wishListButton.setImage(UIImage(named: "wishList_selected_icon.png"), for: UIControlState.normal)
            self.makeToast(message: "Item added to Wish List", duration: 1.0, position: "center" as AnyObject);
           // wishListButton.tag = 2
        }
//        else if wishListButton.tag == 2{
//            removeFromWishList(wishListButton)
//             wishListButton.setImage(UIImage(named: "wishList_icon.png"), for: UIControlState.normal)
//             self.makeToast(message: "Item removed from Wish List", duration: 1.0, position: "center" as AnyObject);
//            wishListButton.tag = 1
//        }
  
    }
    

}
