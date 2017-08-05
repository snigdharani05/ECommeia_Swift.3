//
//  GlobalFunctions.swift
//  ECom
//
//  Created by HyperThink Systems on 27/07/17.
//  Copyright © 2017 HTS. All rights reserved.
//

import Foundation
import UIKit

class GlobalFunctions: NSObject {
    
    static let global = GlobalFunctions()
    
    
    
    class func saveValueInDefaults(_ value:AnyObject, keyIs:String)
    {
        defaults.set(value, forKey: keyIs)
        defaults.synchronize()
    }
    
    class func getValueFromDefaults(_ key:String) -> AnyObject
    {
        if (defaults.object(forKey: key) != nil){
            return defaults.object(forKey: key)! as AnyObject
        }
        return "" as AnyObject;
    }
    
    class func removeValueFromDefaults(_ key: String){
        
        if (defaults.object(forKey: key) != nil){
            defaults.removeObject(forKey: key)
        }
    }

    

}

extension UIImageView{
    
    func setImageFromURl(stringImageUrl url: String){
        
        if let url = NSURL(string: url) {
            if let data = NSData(contentsOf: url as URL) {
                self.image = UIImage(data: data as Data)
            }
        }
    }
    
  
    //    let imgURL = "https://yourdomain.com/picturepath/picname.png" // or jpg
    //    self.myImage.setImageFromURl(stringImageUrl: imgURL)

    
    
}


extension UIView
{
    internal func roundBorder(_ value : CGFloat){
        self.layer.cornerRadius = value * self.frame.size.width
        self.clipsToBounds = true
}
    
    internal func applyBorderColor (_ width: CGFloat, color: UIColor){
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
    }
    

    
    internal func invisibleAndtransformed(val1:CGFloat, val2:CGFloat, delay : TimeInterval)
    {
        UIView.animate(withDuration: 2.0, delay: delay, usingSpringWithDamping: 0.55, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.curveLinear, animations: {() -> Void in
            self.transform = CGAffineTransform(translationX: val1, y: val2)
            self.alpha = 0.0
        }, completion: {(anim) -> Void in
        })
    }
    
    
    func dropShadow(scale: Bool = true) {
        
//        self.layer.masksToBounds = false
//        self.layer.shadowColor = UIColor.black.cgColor
//        self.layer.shadowOpacity = 0.5
//        self.layer.shadowOffset = CGSize(width: -1, height: 1)

//        self.layer.shadowRadius = 1
//        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
//        self.layer.shouldRasterize = true
//        self.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
        
        self.layer.shadowColor = gray.cgColor
        self.layer.shadowOffset = CGSize(width: 5, height: 5)
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 1.0
    }

}


extension UIPageViewController{
    
    
    internal func setViews(_ view: [UIView]?, direction: UIPageViewControllerNavigationDirection, animated: Bool, completion: ((Bool) -> Swift.Void)? = nil){
        
    }

}



