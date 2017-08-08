

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
        if(mycell == nil) {
            collectionView.register(HomeCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "mycell")
            mycell = HomeCollectionViewCell()
        }
        mycell.imageView.setImageFromURl(stringImageUrl: imageURLArray[indexPath.row])
        mycell.itemNameLabel.text = itemNameArray[indexPath.row]
        mycell.itemPriceLabel.text = itemPriceArray[indexPath.row]
        
        mycell.backgroundColor = UIColor.clear
        
        return mycell
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
