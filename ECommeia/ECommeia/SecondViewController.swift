//
//  SecondViewController.swift
//  ECommeia
//
//  Created by HyperThink Systems on 31/07/17.
//  Copyright © 2017 HTS. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var readyBBQPackage: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        readyBBQPackage.delegate = self
        readyBBQPackage.dataSource = self
        readyBBQPackage.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "mycell")
        let nib = UINib(nibName: "HomeCollectionViewCell", bundle: nil)
        readyBBQPackage.register(nib, forCellWithReuseIdentifier: "mycell")
        readyBBQPackage?.allowsMultipleSelection = true
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return imageURLArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var mycell : HomeCollectionViewCell! = readyBBQPackage.dequeueReusableCell(withReuseIdentifier: "mycell", for: indexPath) as! HomeCollectionViewCell
        if(mycell == nil) {
            collectionView.register(HomeCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "mycell")
            mycell = HomeCollectionViewCell()
        }
        mycell.imageView.setImageFromURl(stringImageUrl: imageURLArray[indexPath.row])
        mycell.backgroundColor = UIColor.clear
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
}
