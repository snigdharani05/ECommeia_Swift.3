//
//  FirstView.swift
//  ECommeia
//
//  Created by HyperThink Systems on 28/07/17.
//  Copyright © 2017 HTS. All rights reserved.
//

import UIKit

class FirstView: UIView, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    internal override init(frame: CGRect) {
        super .init(frame: frame)
        let myView = Bundle.main.loadNibNamed("FirstView", owner: self, options: nil)?[0] as! UIView
        self.frame = frame
        myView.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        self.addSubview(myView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "mycell")
        let nib = UINib(nibName: "HomeCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "mycell")
        collectionView?.allowsMultipleSelection = true
        //collectionView.reloadData()
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        
        return imageURLArray.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var mycell : HomeCollectionViewCell! = collectionView.dequeueReusableCell(withReuseIdentifier: "mycell", for: indexPath) as! HomeCollectionViewCell
        if(mycell == nil) {
            collectionView.register(HomeCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "mycell")
            mycell = HomeCollectionViewCell()
        }
        mycell.imageView.setImageFromURl(stringImageUrl: imageURLArray[indexPath.row])

        mycell.backgroundColor = UIColor.clear
        
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mycell", for: indexPath)
//        
//        cell.backgroundColor = UIColor.red
//        let imageView:UIImageView = UIImageView()
//        imageView.frame = cell.frame
//        imageView.setImageFromURl(stringImageUrl: imageURLArray[indexPath.row])
//        imageView.layer.borderWidth = 1
//        imageView.layer.borderColor = UIColor.blue.cgColor
//        
//        cell.addSubview(imageView)

        return mycell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        let cell = collectionView.cellForItem(at: indexPath) as UICollectionViewCell?
        print("You selected cell #\(indexPath.item)!")
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeslectItemAtIndexPath indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as UICollectionViewCell?
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize{
        var size = CGSize(width: 0,height: 0)
        let size1 = CGSize(width: collectionView.frame.size.width/2, height: collectionView.frame.size.height/2)
        size = size1
        return size;
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0.0,0.0,0.0,0.0)
    }

    
    

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
