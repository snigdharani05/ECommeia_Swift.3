//
//  ThirdViewController.swift
//  ECommeia
//
//  Created by HyperThink Systems on 31/07/17.
//  Copyright © 2017 HTS. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource{
    
    @IBOutlet weak var bbqConsumable: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        bbqConsumable.delegate = self
        bbqConsumable.dataSource = self
        bbqConsumable.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "mycell")
        let nib = UINib(nibName: "HomeCollectionViewCell", bundle: nil)
        bbqConsumable.register(nib, forCellWithReuseIdentifier: "mycell")
        bbqConsumable?.allowsMultipleSelection = true
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        
        return imageURLArray.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var mycell : HomeCollectionViewCell! = bbqConsumable.dequeueReusableCell(withReuseIdentifier: "mycell", for: indexPath) as! HomeCollectionViewCell
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
