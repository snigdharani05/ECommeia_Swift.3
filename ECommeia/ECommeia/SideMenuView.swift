//
//  SideMenuView.swift
//  ECommeia
//
//  Created by HyperThink Systems on 01/08/17.
//  Copyright © 2017 HTS. All rights reserved.
//

import UIKit

class SideMenuView: UIView, UITableViewDelegate, UITableViewDataSource{
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var menuHeaderView: UIView!
    
    @IBOutlet weak var profilePicButton: UIButton!
    
    @IBOutlet weak var userNameButton: UILabel!
    
    var titleArray : [String] = []
    
    internal override init(frame: CGRect) {
        super .init(frame: frame)
        let myView = Bundle.main.loadNibNamed("SideMenuView", owner: self, options: nil)?[0] as! UIView
        self.frame = frame
        myView.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        self.addSubview(myView)
        
        profilePicButton.roundBorder(0.5)
        profilePicButton.applyTrasperentBorderColor()
       
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        tableView.addGestureRecognizer(swipeLeft)
        
        let swipeLeft1 = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(_:)))
        swipeLeft1.direction = UISwipeGestureRecognizerDirection.left
        self.addGestureRecognizer(swipeLeft1)
        
        let swipeLeft2 = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(_:)))
        swipeLeft2.direction = UISwipeGestureRecognizerDirection.left
        menuHeaderView.addGestureRecognizer(swipeLeft2)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = UIColor.clear
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        let nib = UINib(nibName: "SideMenuDrawerTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "myCell")
        titleArray = ["My Quests","Recent" ,"Interest 1" ,"Interest 2" ,"Interest 3" ]

        
    }
    
    
    func respondToSwipeGesture(_ gesture: UISwipeGestureRecognizer) {
        
            switch gesture.direction {
            
            case UISwipeGestureRecognizerDirection.left:
                print("Swiped left")
                
                UIView.animate(withDuration: 2.0, delay: 0.0, usingSpringWithDamping: 0.55, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.curveLinear, animations: {() -> Void in
                    self.transform = CGAffineTransform(translationX: -600, y: 0)
                    //self.alpha = 0.0
                }, completion: {(anim) -> Void in
                })

                
                break

            default:
                break
            
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return titleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell: SideMenuDrawerTableViewCell! = self.tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! SideMenuDrawerTableViewCell
        cell.label.text = titleArray[indexPath.row] as? String
        cell.backgroundColor = UIColor.clear
        
        
        return cell
        
    }

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}


