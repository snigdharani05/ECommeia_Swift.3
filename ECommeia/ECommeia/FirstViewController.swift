

//
//  FirstViewController.swift
//  ECommeia
//
//  Created by HyperThink Systems on 31/07/17.
//  Copyright © 2017 HTS. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var foodCollectionView: UICollectionView!
    
    var home : HomeViewController! = HomeViewController()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        foodCollectionView.delegate = self
        foodCollectionView.dataSource = self
        foodCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "mycell")
        let nib = UINib(nibName: "HomeCollectionViewCell", bundle: nil)
        foodCollectionView.register(nib, forCellWithReuseIdentifier: "mycell")
        foodCollectionView?.allowsMultipleSelection = true
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return imageURLArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var mycell : HomeCollectionViewCell! = foodCollectionView.dequeueReusableCell(withReuseIdentifier: "mycell", for: indexPath) as! HomeCollectionViewCell
        mycell.first = self
        if(mycell == nil) {
            collectionView.register(HomeCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "mycell")
            mycell = HomeCollectionViewCell()
        }
        mycell.imageView.setImageFromURl(stringImageUrl: imageURLArray[indexPath.row])
        mycell.itemNameLabel.text = itemNameArray[indexPath.row]
        mycell.itemPriceLabel.text = itemPriceArray[indexPath.row]
        mycell.backgroundColor = UIColor.clear
       // mycell.wishListButton.addTarget(self, action:#selector(wishListButtonAction(_:)), for: .touchUpInside)
        
        return mycell
    }
    
    func wishListButtonAction(_ sender: UIButton){
        let buttnPositn : CGPoint = sender.convert(CGPoint.zero, to: self.foodCollectionView)
        let indexPath : NSIndexPath = self.foodCollectionView.indexPathForItem(at: buttnPositn)! as NSIndexPath
        let mycell : HomeCollectionViewCell! = foodCollectionView.dequeueReusableCell(withReuseIdentifier: "mycell", for: indexPath as IndexPath) as! HomeCollectionViewCell
        
        
        if mycell.wishListButton.tag == 1{
            //add
            //mycell.wishListButton.addTarget(self, action:#selector(addToWishList(_:)), for: .touchUpInside)
            
            wishListDictionary = ["ItemName" : "\(itemNameArray[indexPath.row])" , "ItemPrice" : "\(itemPriceArray[indexPath.row])"]
            print(wishListDictionary)
            
            wishListArray.append((wishListDictionary as NSDictionary) as! [String : String])
            print(wishListArray)
            
            
            mycell.wishListButton.setImage(UIImage(named: "wishList_selected_icon.png"), for: UIControlState.normal)
            
            self.view.makeToast(message: "Item added to Wish List", duration: 1.0, position: "center" as AnyObject)
            mycell.wishListButton.tag = 2
        }
        else if mycell.wishListButton.tag == 2{
            //remove
            //mycell.wishListButton.addTarget(self, action:#selector(removeFromWishList(_:)), for: .touchUpInside)
            wishListArray.remove(at: indexPath.row)
            mycell.wishListButton.setImage(UIImage(named: "wishList_icon.png"), for: UIControlState.normal)
            self.view.makeToast(message: "Item removed from Wish List", duration: 1.0, position: "center" as AnyObject)
            mycell.wishListButton.tag = 1
        }

        
    }
    

    
    func removeFromWishList(_ sender: UIButton){
        
        let buttnPositn : CGPoint = sender.convert(CGPoint.zero, to: self.foodCollectionView)
        let indexPath : NSIndexPath = self.foodCollectionView.indexPathForItem(at: buttnPositn)! as NSIndexPath
        
        wishListArray.remove(at: indexPath.row)
        
    }

    
    
    
    
    func addToWishList(_ sender: UIButton){
                
        let buttnPositn : CGPoint = sender.convert(CGPoint.zero, to: self.foodCollectionView)
        let indexPath : NSIndexPath = self.foodCollectionView.indexPathForItem(at: buttnPositn)! as NSIndexPath
        
        wishListDictionary = ["ItemName" : "\(itemNameArray[indexPath.row])" , "ItemPrice" : "\(itemPriceArray[indexPath.row])"]
        print(wishListDictionary)
        
        wishListArray.append((wishListDictionary as NSDictionary) as! [String : String])
        print(wishListArray)
    }

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        
        home.menuButton.tag = 2
        home.menuButton.setImage(UIImage(named: "back_icon_white.png"), for: UIControlState.normal)
        let cell = collectionView.cellForItem(at: indexPath) as! HomeCollectionViewCell?
        
        let name = cell?.itemNameLabel.text
        let imageView = cell?.imageView.image
        let price = cell?.itemPriceLabel.text
        
        print("You selected cell #\(indexPath.item)!")
        home.showDetailItemView()
        home.detailView.itemNameLabel.text = name
        home.detailView.itemImageView.image = imageView
        home.detailView.itemImageView.alpha = 1.0
        home.detailView.itemPriceLabel.text = price

    }
    
    func collectionView(_ collectionView: UICollectionView, didDeslectItemAtIndexPath indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as UICollectionViewCell?
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize{
        var size = CGSize(width: 0,height: 0)
        let size1 = CGSize(width: collectionView.frame.size.width/2, height: collectionView.frame.size.height/2.2)
        size = size1
        return size;
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0.0,0.0,0.0,0.0)
    }
    
    
       

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
