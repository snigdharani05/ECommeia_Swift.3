//
//  HomeViewController.swift
//  ECommeia
//
//  Created by HyperThink Systems on 28/07/17.
//  Copyright © 2017 HTS. All rights reserved.
//

import UIKit
import PageMenu


class HomeViewController: UIViewController, CAPSPageMenuDelegate, UIScrollViewDelegate {
    
    
    @IBOutlet weak var homeButton: UIButton!
    
    @IBOutlet weak var titleBarView: UIView!
    
    @IBOutlet weak var menuButton: UIButton!
    
    @IBOutlet weak var cartButton: UIButton!
    
    //@IBOutlet weak var titleLabel: UILabel!
    
    var pageMenu : CAPSPageMenu?

    var homeView : HomeView!
    
    var sideMenu : SideMenuView!
    
    var detailView : DetailsView!
    
    var cartView : CartView!
    
    var wishListView : WishListView!
    
    var controller1 : FirstViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuButton.tag = 1
                
        var controllerArray : [UIViewController] = []
        
        controller1 = FirstViewController(nibName: "FirstViewController", bundle: nil)
        controller1?.title = "Food"
        // firstView = FirstView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: controller1.view.frame.height))
        // controller1.view.addSubview(firstView)
        controllerArray.append(controller1!)
        
        let controller2 : SecondViewController = SecondViewController(nibName: "SecondViewController", bundle: nil)
        controller2.title = "Cloth"
        controllerArray.append(controller2)
        
        let controller3 : ThirdViewController = ThirdViewController(nibName: "ThirdViewController", bundle: nil)
        controller3.title = "Elect"
        controllerArray.append(controller3)
        
        let controller4 : FourthViewController = FourthViewController(nibName: "FourthViewController", bundle: nil)
        controller4.title = "Home"
        controllerArray.append(controller4)
        
        let controller5 : FifthViewController = FifthViewController(nibName: "FifthViewController", bundle: nil)
        controller5.title = "Gifts"
        controllerArray.append(controller5)
        
        let parameters: [CAPSPageMenuOption] = [
            .menuItemSeparatorWidth(3),
            .useMenuLikeSegmentedControl(true),
            .menuItemSeparatorPercentageHeight(0.1),
            .menuItemWidthBasedOnTitleTextWidth(true)]
        
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRect(x:0.0, y:screenHeight/8.1, width:self.view.frame.width, height:screenHeight/1.14), pageMenuOptions: parameters)
        
        self.view.addSubview(pageMenu!.view)
        pageMenu!.delegate = self
        
        controller1?.home = self
        self.addChildViewController(controller1!)

    }
    
    

    func moveToFirstdPage(){
        pageMenu?.moveToPage(0)
    }
    func moveToSecondPage(){
        pageMenu?.moveToPage(1)
    }
    func moveToThirddPage(){
        pageMenu?.moveToPage(2)
    }
    func moveToFourthPage(){
        pageMenu?.moveToPage(3)
    }
    func moveToFifthPage(){
        pageMenu?.moveToPage(4)
    }
    
    
    func removeSubView(){
        
        if sideMenu != nil{
            sideMenu.removeFromSuperview()
        }
        
        if detailView != nil{
            detailView.removeFromSuperview()
        }
        
        if cartView != nil{
            cartView.removeFromSuperview()
        }
        
        if wishListView != nil{
            wishListView.removeFromSuperview()
        }
    }

    
    @IBAction func buttonActions(_ sender: UIButton) {
        
        switch sender {
        case menuButton:
            
            if menuButton.tag == 1{
                removeSubView()
                showSideMenuView()
            }
            else if menuButton.tag == 2{
                removeSubView()
                menuButton.tag = 1
                detailView.removeFromSuperview()
                menuButton.setImage(UIImage(named: "menu_icon.png"), for: UIControlState.normal)
//                if sideMenu != nil{
//                    UIView.animate(withDuration: 2.0, delay: 0.0, usingSpringWithDamping: 0.55, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.curveLinear, animations: {() -> Void in
//                        self.sideMenu.transform = CGAffineTransform(translationX: -600, y: 0)
//                        //self.alpha = 0.0
//                    }, completion: {(anim) -> Void in
//                    })
//                    
//
//                    //sideMenu.removeFromSuperview()
//                }
            }
            break
            
        case cartButton:
            removeSubView()
            showMyCartView()
            menuButton.tag = 1
            menuButton.setImage(UIImage(named: "menu_icon.png"), for: UIControlState.normal)
            
            break
            
        case homeButton:
            removeSubView()
            menuButton.tag = 1
            menuButton.setImage(UIImage(named: "menu_icon.png"), for: UIControlState.normal)
            break
        default:
            break
        }
    }
    
//    func willMoveToPage(controller: UIViewController, index: Int){}
//    
//    func didMoveToPage(controller: UIViewController, index: Int){}
    
    func showHomeView(){
        homeView = HomeView(frame: CGRect(x: 0, y: screenHeight/8.1, width: screenWidth, height: screenHeight/1.14))
        self.view.addSubview(homeView)
        homeView.home = self
    }
    
    func showMyCartView(){
        removeSubView()
        cartView = CartView(frame: CGRect(x: 0, y: screenHeight/8.1, width: screenWidth, height: screenHeight/1.14))
        self.view.addSubview(cartView)
        //homeView.home = self
    }

    func showWishListView(){
        removeSubView()
        wishListView = WishListView(frame: CGRect(x: 0, y: screenHeight/8.1, width: screenWidth, height: screenHeight/1.14))
        self.view.addSubview(wishListView)
        //homeView.home = self
    }
    
    func showSideMenuView(){
        sideMenu = SideMenuView(frame: CGRect(x: 0, y: titleBarView.frame.origin.y , width: screenWidth, height: screenHeight - titleBarView.frame.origin.y))

        let transition = CATransition()
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromLeft
        sideMenu.layer.add(transition, forKey: nil)
        self.view.addSubview(self.sideMenu)
        
        sideMenu.home = self

//       sideMenu.transform = CGAffineTransform(translationX: -600, y: 0)
//        
//        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.curveLinear, animations: {() -> Void in
//            self.sideMenu.transform = CGAffineTransform(translationX: 0, y: 0.0)
//        }, completion: {(anim) -> Void in
//            self.sideMenu.backgroundColor = UIColor(white: 0, alpha: 0.5)
//        })
    }
    
    func showDetailItemView(){

        detailView = DetailsView(frame: CGRect(x: 0, y: screenHeight/8.1 , width: screenWidth, height: screenHeight - (titleBarView.frame.origin.y + titleBarView.frame.size.height)))
        self.view.addSubview(detailView)
        //detailView.home = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
