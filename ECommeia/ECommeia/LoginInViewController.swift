//
//  LoginInViewController.swift
//  ECommeia
//
//  Created by HyperThink Systems on 29/07/17.
//  Copyright © 2017 HTS. All rights reserved.
//

import UIKit
import CoreData

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
    
    func buttonTapped() {
        
//        let appDel : AppDelegate = (UIApplication.shared.delegate as! AppDelegate)
//        let context : NSManagedObjectContext = appDel.managedObjectContext
//        
//        let request = NSFetchRequest(entityName: "Users")
//        request.returnsObjectsAsFaults = false
//        request.predicate = NSPredicate(format: "username = %@", "" + txtUsername.text!)
//        
//        let results:NSArray = try! context.executeFetchRequest(request)
//        
//        if(results.count > 1){
//            let res = results[0] as! NSManagedObject
//            txtUsername.text = res.valueForKey("username") as! String
//            txtPassword.text = res.valueForKey("password") as! String
//            
//            //for res in results {
//            //   print(res)
//        }else{
//            print("Incorrect username and password")
//        }
//    }
//
//    
    
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        let context = appDelegate.managedObjectContext
        
        
        
//        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//        let task = Task(context: context) // Link Task & Context
//        task.name = "Silu"
//        
//        // Save the data to coredata
//        (UIApplication.shared.delegate as! AppDelegate).saveContext()
//        
//        let _ = navigationController?.popViewController(animated: true)
        
        
        
//        var newUser = NSEntityDescription.insertNewObject(forEntityName: "LoginDetails", into: context) as NSManagedObject
//        
//        newUser.setValue("silu", forKey: "userName")
//        
//        newUser.setValue("123", forKey: "password")
//        
//        context.save(
        
        
        
        
        
        let managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "LoginDetails", in: managedContext)!
        let CSI = NSManagedObject(entity: entity, insertInto: managedContext)
        
        CSI.setValue("silu", forKey: "userName")
        CSI.setValue("123", forKey: "password")
        CSI.setValue("silu@gmail.com", forKey: "emailId")
        
        do {
            try managedContext.save()
            print("saved!")
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }


    
    @IBAction func buttonActions(_ sender: UIButton) {
        buttonTapped()
        
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
