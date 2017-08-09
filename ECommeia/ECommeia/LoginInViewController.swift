//
//  LoginInViewController.swift
//  ECommeia
//
//  Created by HyperThink Systems on 29/07/17.
//  Copyright © 2017 HTS. All rights reserved.
//

import UIKit

class LoginInViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var mobileTextFiled: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        UITextField.changePlaceHolderColor(nameTextField, placeHolderString: "Enter Your Name", color: title_Bar_Color ,fontSize: 14, fontName: helvetica_Bold)
        
        UITextField.changePlaceHolderColor(mobileTextFiled, placeHolderString: "Enter Mobile Number", color: title_Bar_Color ,fontSize: 14, fontName: helvetica_Bold)
        
        UITextField.changePlaceHolderColor(emailTextField, placeHolderString: "Enter Your EmailId", color: title_Bar_Color ,fontSize: 14, fontName: helvetica_Bold)
    
    
    }

    
    @IBAction func buttonActions(_ sender: UIButton) {
        
        performSegue(withIdentifier: "Home", sender: self)
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
