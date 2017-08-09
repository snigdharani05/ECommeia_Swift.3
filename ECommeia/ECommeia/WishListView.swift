//
//  WishListView.swift
//  ECommeia
//
//  Created by HyperThink Systems on 03/08/17.
//  Copyright © 2017 HTS. All rights reserved.
//

import UIKit

class WishListView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var wishListTableView: UITableView!
    
    @IBOutlet weak var emptyLabel: UILabel!

    internal override init(frame: CGRect) {
        super .init(frame: frame)
        let myView = Bundle.main.loadNibNamed("WishListView", owner: self, options: nil)?[0] as! UIView
        self.frame = frame
        myView.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        self.addSubview(myView)
        
        wishListTableView.delegate = self
        wishListTableView.dataSource = self
        wishListTableView.separatorColor = UIColor.clear
        wishListTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        let nib = UINib(nibName: "MyCartTableViewCell", bundle: nil)
        wishListTableView.register(nib, forCellReuseIdentifier: "myCell")
        wishListTableView.separatorColor = gray
        emptyLabel.dropShadow(scale: true)
        self.wishListTableView.tableFooterView = UIView()
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return wishListArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell: MyCartTableViewCell! = self.wishListTableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! MyCartTableViewCell
        cell.itemNameLabel?.text = wishListArray[indexPath.row]["ItemName"]
        cell.itemPriceLabel?.text = wishListArray[indexPath.row]["ItemPrice"]
        //cell.quantityLabel?.text = "Qt.  " + cartArray[indexPath.row]["ItemQuantity"]!
        cell.backgroundColor = UIColor.clear
        cell.removeFromCartListButton.addTarget(self, action:#selector(removeWishListItem(_:)), for: .touchUpInside)
        return cell
    }
    
    
    func removeWishListItem(_ sender : UIButton!){
        
        let buttnPositn : CGPoint = sender.convert(CGPoint.zero, to: self.wishListTableView)
        let indexPath : NSIndexPath = self.wishListTableView.indexPathForRow(at: buttnPositn)! as NSIndexPath
        
        wishListArray.remove(at: indexPath.row)
        self.wishListTableView!.reloadData()
        
        self.makeToast(message: "One item removed", duration: 2.0, position: "bottom" as AnyObject);
        
        if wishListArray.count == 0{
            self.wishListTableView.isHidden = true
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let selectedCell:UITableViewCell = tableView.cellForRow(at: indexPath)!
        print(selectedCell)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
