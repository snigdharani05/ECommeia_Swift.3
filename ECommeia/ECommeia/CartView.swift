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

    }
    
    
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 10
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
            let cell: MyCartTableViewCell! = self.myCartTableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! MyCartTableViewCell
            
            cell.backgroundColor = UIColor.clear
            
            return cell
          }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let selectedCell:UITableViewCell = tableView.cellForRow(at: indexPath)!
        print(selectedCell)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
