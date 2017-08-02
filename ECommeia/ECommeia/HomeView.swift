//
//  HomeView.swift
//  ECommeia
//
//  Created by HyperThink Systems on 28/07/17.
//  Copyright © 2017 HTS. All rights reserved.
//

import UIKit

class HomeView: UIView{
    
    var home : HomeViewController! = HomeViewController()
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    
    internal override init(frame: CGRect) {
        super.init(frame: frame)
        let  myView  = Bundle.main.loadNibNamed("HomeView", owner: self, options: nil)?[0] as! UIView
        self.frame =  frame
        myView.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        self.addSubview(myView)
        
        
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.holeSwiped(_:)))
        //let swipeRight = UISwipeGestureRecognizer(target: self, action: "holeSwiped:")
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.addGestureRecognizer(swipeRight)
        
        //let swipeLeft = UISwipeGestureRecognizer(target: self, action: "holeSwiped:")
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.holeSwiped(_:)))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.addGestureRecognizer(swipeLeft)
        
}
    
    @IBAction func swipeAction(_ sender: UISwipeGestureRecognizer) {
        
        if (sender.direction == UISwipeGestureRecognizerDirection.left)
        {
            print("left")
        }else if sender.direction == .right {
            print("right")
        }
    }
    
    
    func holeSwiped(_ gesture: UISwipeGestureRecognizer)
    {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.right:
                print("right swipe")
            case UISwipeGestureRecognizerDirection.left:
                print("left swipe")
            default:
                print("other swipe")
            }
        }
    }
    
    
       
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    

}
