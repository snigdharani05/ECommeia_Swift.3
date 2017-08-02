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
    
    var nameArray : [[String]]!
    
    var profileArray : [[String]]!
    
    var groupArray : NSArray!
    
    internal override init(frame: CGRect) {
        super .init(frame: frame)
        let myView = Bundle.main.loadNibNamed("SideMenuView", owner: self, options: nil)?[0] as! UIView
        self.frame = frame
        myView.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        self.addSubview(myView)
        
        profilePicButton.roundBorder(0.5)
        profilePicButton.applyBorderColor(3.0, color: gray)
       
        
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
        //titleArray = ["My Quests","Recent" ,"Interest 1" ,"Interest 2" ,"Interest 3" ]
        
        
        nameArray = [["Food","Ready BBQ Packages","BBQ Consumables","Entertainment","FastFood Delivery","Camping Gear","More"],["My Cart", "My Wishlist"],["Contact Us","Tearms & Conditions","Help Center"]]
        
        profileArray = [["food_slider_icon.png","bbq_ready_icon.png","bbq_consumables.png","entertainment_slider_icon.png","fast_food_delivery.png","rental_slider_icon.png","food_slider_icon.png"],["cart_slider_icon.png", "wishList_icon.png"],["","",""]]
        
        groupArray = ["","My Purchase","Help & Support"]


        
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
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int{
        return groupArray.count
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //return "Section \(section)"
        
        return groupArray.object(at: section) as? String
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return (nameArray[section] as AnyObject).count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        
        
        if indexPath.section == 0 || indexPath.section == 1{
            
            let cell: SideMenuDrawerTableViewCell! = self.tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! SideMenuDrawerTableViewCell
            cell.menuImageView.image = UIImage(named: (profileArray[indexPath.section][indexPath.row]))
            cell.label.text = (nameArray[indexPath.section][indexPath.row])
            cell.backgroundColor = UIColor.clear

              return cell
        }else  {
            
            let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "Cell") as UITableViewCell!

            cell.textLabel?.text = (nameArray[indexPath.section][indexPath.row])
            cell.textLabel?.font = UIFont(name: helvetica_Bold, size: 12)
            cell.backgroundColor = UIColor.clear
            
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat{
        return 1.0
    }
    
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        
        let title = UILabel()
        title.font = UIFont(name: helvetica_Bold, size: 14)
       // header.tintColor = optionButtonColor
        header.textLabel?.textColor = title_Bar_Color
        header.textLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        header.textLabel?.font = UIFont(name: helvetica_Bold, size: 14)
        header.textLabel?.font = title.font
        header.textLabel?.frame = header.frame
        header.textLabel?.textAlignment = .left
    }
    
    
    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int){
        guard let footer = view as? UITableViewHeaderFooterView else { return }
        
         footer.tintColor = gray

    }


    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}


