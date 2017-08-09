//
//  CartView.swift
//  ECommeia
//
//  Created by HyperThink Systems on 03/08/17.
//  Copyright © 2017 HTS. All rights reserved.
//

import UIKit

class CartView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    @IBOutlet weak var myCartTableView: UITableView!
    
    @IBOutlet weak var emptyLabel: UILabel!
    
    @IBOutlet weak var checkOutButton: UIButton!
    
    var home : HomeViewController! = HomeViewController()
    
    
    internal override init(frame: CGRect) {
        super .init(frame: frame)
        let myView = Bundle.main.loadNibNamed("CartView", owner: self, options: nil)?[0] as! UIView
        self.frame = frame
        myView.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        self.addSubview(myView)
        myCartTableView.delegate = self
        myCartTableView.dataSource = self
        myCartTableView.separatorColor = UIColor.clear
        myCartTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        let nib = UINib(nibName: "MyCartTableViewCell", bundle: nil)
        myCartTableView.register(nib, forCellReuseIdentifier: "myCell")
        myCartTableView.separatorColor = gray
        self.myCartTableView.tableFooterView = UIView()
        
       /* let getArray = defaults.object(forKey: "CartArray")
        if getArray != nil{
            myCartTableView.isHidden = false
            print(getArray!)
            print(getCartArray)
            getCartArray = getArray as! [[String : String]]
        }else{
            myCartTableView.isHidden = true
        }*/
        
        if cartArray.count != 0{
            
            myCartTableView.isHidden = false
            checkOutButton.isHidden = false
        }
        else{
            myCartTableView.isHidden = true
            checkOutButton.isHidden = true
        }
        
        emptyLabel.dropShadow(scale: true)
        
        let total = GlobalFunctions.calculateTotalPrice()
        totalPriceLabel.text = total
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
      home.loadCheckOutViewController()
    }
    
    
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return cartArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell: MyCartTableViewCell! = self.myCartTableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! MyCartTableViewCell
        cell.itemNameLabel?.text = cartArray[indexPath.row]["ItemName"]
        cell.itemPriceLabel?.text = cartArray[indexPath.row]["ItemPrice"]
        cell.quantityLabel?.text = "Qt.  " + cartArray[indexPath.row]["ItemQuantity"]!
        cell.backgroundColor = UIColor.clear
        cell.removeFromCartListButton.addTarget(self, action:#selector(removeCartItem(_:)), for: .touchUpInside)
        return cell
    }
    
     
    func removeCartItem(_ sender : UIButton!){
        
        let buttnPositn : CGPoint = sender.convert(CGPoint.zero, to: self.myCartTableView)
        let indexPath : NSIndexPath = self.myCartTableView.indexPathForRow(at: buttnPositn)! as NSIndexPath
        
        cartArray.remove(at: indexPath.row)
        self.myCartTableView!.reloadData()
        
        let total = GlobalFunctions.calculateTotalPrice()
        totalPriceLabel.text = total
        self.makeToast(message: "One item removed", duration: 2.0, position: "bottom" as AnyObject);
        
        if cartArray.count == 0{
            self.myCartTableView.isHidden = true
            checkOutButton.isHidden = true
        }
        
//        if cartArray.count == 0{
//            home.badgeLabel.isHidden = true
//            home.badgeImageView.isHidden = true
//        }else if cartArray.count > 0{
//            home.badgeLabel.isHidden = false
//            home.badgeImageView.isHidden = false
//            home.badgeLabel.text = "\(cartArray.count)"
//        }
        
        GlobalFunctions.badge(badgeLabel: home.badgeLabel, badgeImageView : home.badgeImageView)
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let selectedCell:UITableViewCell = tableView.cellForRow(at: indexPath)!
        print(selectedCell)
    }
    
//    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        return true
//    }
//    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            print("Deleted")
//            self.getCartArray.remove(at: indexPath.row)
//            self.myCartTableView.beginUpdates()
//            self.myCartTableView.deleteRows(at: [indexPath], with: .automatic)
//            self.myCartTableView.endUpdates() }}
//    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
