//
//  HomeViewController.swift
//  ECommeia
//
//  Created by HyperThink Systems on 28/07/17.
//  Copyright © 2017 HTS. All rights reserved.
//

import UIKit
import PageMenu


class HomeViewController: UIViewController, CAPSPageMenuDelegate {
    
    @IBOutlet weak var titleBarView: UIView!
    
    @IBOutlet weak var menuButton: UIButton!
    
    @IBOutlet weak var cartButton: UIButton!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var homeView : HomeView!
    
    var firstView : FirstView!
    
    var secondView : SecondView!
    
    var thirdView : ThirdView!
    
    var pageMenu : CAPSPageMenu?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // showHomeView()
       // showFirstView()
        
        
        var controllerArray : [UIViewController] = []
        
        let controller1 : FirstViewController = FirstViewController(nibName: "FirstViewController", bundle: nil)
        controller1.title = "Food"
        firstView = FirstView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: controller1.view.frame.height))
        controller1.view.addSubview(firstView)
        controllerArray.append(controller1)
        
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
        
        var parameters: [CAPSPageMenuOption] = [
            .menuItemSeparatorWidth(3),
            .useMenuLikeSegmentedControl(true),
            .menuItemSeparatorPercentageHeight(0.1),
            .menuItemWidthBasedOnTitleTextWidth(true)]
        
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRect(x:0.0, y:screenHeight/8.1, width:self.view.frame.width, height:screenHeight/1.14), pageMenuOptions: parameters)
        
        self.view.addSubview(pageMenu!.view)
        pageMenu!.delegate = self
    }
    
    
    func willMoveToPage(controller: UIViewController, index: Int){}
    
    func didMoveToPage(controller: UIViewController, index: Int){}
    
    func showHomeView(){
        homeView = HomeView(frame: CGRect(x: 0, y: screenHeight/8.1, width: screenWidth, height: screenHeight/1.14))
        self.view.addSubview(homeView)
        homeView.home = self
    }
    
    func showFirstView(){
        firstView = FirstView(frame: CGRect(x: 0, y: screenHeight/5, width: screenWidth, height: screenHeight/1.25))
        self.view.addSubview(firstView)
        //firstView.home = self
    }
    
    func showSecondView(){
        secondView = SecondView(frame: CGRect(x: 0, y: screenHeight/5, width: screenWidth, height: screenHeight/1.25))
        self.view.addSubview(secondView)
       // firstView.home = self
    }

    func showThirdView(){
        thirdView = ThirdView(frame: CGRect(x: 0, y: screenHeight/5, width: screenWidth, height: screenHeight/1.25))
        self.view.addSubview(thirdView)
       // firstView.home = self
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
