//
//  DetailsView.swift
//  ECommeia
//
//  Created by HyperThink Systems on 03/08/17.
//  Copyright © 2017 HTS. All rights reserved.
//

import UIKit

class DetailsView: UIView{
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var itemImageView: UIImageView!
    
    @IBOutlet weak var itemNameLabel: UILabel!
    
    @IBOutlet weak var itemPriceLabel: UILabel!
    
    @IBOutlet weak var quantityDecrementButton: UIButton!
    
    @IBOutlet weak var quantityIncrementButton: UIButton!
    
    @IBOutlet weak var quanityLabel: UILabel!
    
    @IBOutlet weak var addToCartButton: UIButton!
    
    @IBOutlet weak var buyNowButton: UIButton!
    
    var i : Int! = 1
    
    var cartArray : [NSDictionary] = [NSDictionary]()
    
    var dict : [String : String] = [String : String]()
    
    internal override init(frame: CGRect) {
        super .init(frame: frame)
        let myView = Bundle.main.loadNibNamed("DetailsView", owner: self, options: nil)?[0] as! UIView
        self.frame = frame
        myView.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        self.addSubview(myView)
        containerView.applyBorderColor(0.3, color: lightGray)
        
        itemImageView.contentMode = UIViewContentMode.scaleAspectFill
        itemImageView.clipsToBounds = true
        
        if GlobalFunctions.getValueFromDefaults("CartArray") as? [NSDictionary] != nil{
            let getArray = GlobalFunctions.getValueFromDefaults("CartArray") as! [NSDictionary]
            print(getArray)
            cartArray = getArray
        }
    }
    
    @IBAction func buttonActions(_ sender: UIButton) {
        
        switch sender {
        case addToCartButton:
            
            let name = itemNameLabel.text
            let price = itemPriceLabel.text
            let quantity = quanityLabel.text
            
            dict = ["ItemName" : "\(name!)" , "ItemPrice" : "\(price!)", "ItemQuantity" : "\(quantity!)"]
            print(dict)
            
            cartArray.append(dict as NSDictionary)
            print(cartArray)
            
            GlobalFunctions.saveValueInDefaults(cartArray as! NSMutableArray, keyIs: "CartArray")
            
            let getArray = GlobalFunctions.getValueFromDefaults("CartArray") as! [NSDictionary]
            print(getArray)
            
            break
            
        case quantityDecrementButton:
            
            if i > 1{
                i = i-1
                print(i)
                quanityLabel.text = "\(i!)"
            }
            else{
             self.makeToast(message: "Item can't be 0", duration: 2.0, position: "bottom" as AnyObject);
            }
            break
            
        case quantityIncrementButton:
            
            i = i+1
            print(i)
            quanityLabel.text = "\(i!)"
            break
            
        default:
            break
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
