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

}


extension UIPageViewController{
    
    
    internal func setViews(_ view: [UIView]?, direction: UIPageViewControllerNavigationDirection, animated: Bool, completion: ((Bool) -> Swift.Void)? = nil){
        
    }

}



