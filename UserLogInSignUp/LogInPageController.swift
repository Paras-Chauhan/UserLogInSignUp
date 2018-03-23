//
//  LogInPageController.swift
//  UserLogInSignUp
//
//  Created by Appinventiv mac on 23/03/18.
//  Copyright © 2018 Appinventiv mac. All rights reserved.
//

import UIKit

class LogInPageController: UIViewController {

    
    //MARK:- outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordlabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var orLabel: UILabel!
    
    
    @IBAction func logInButton(_ sender: UIButton) {
        let userEmail = emailTextField.text
        let userPassword = passwordTextField.text
        
        let userEmailStored = UserDefaults.standard.string(forKey: "userEmail")
        let userPasswordStored = UserDefaults.standard.string(forKey: "userPassword")
        //let storedValue = UserDefaults.standard.string(forKey: "userName")
        if ( userEmailStored == userEmail){
            if ( userPasswordStored == userPassword){
                //logIn is SuccessFully.
                
                UserDefaults.standard.string(forKey: "IsUserLoggedIn")
                UserDefaults.standard.synchronize()
                
                self.dismiss(animated: true,completion : nil)
            }
        }
        else{
           myAlertMessage(usermessage: "User not existing...")
        }
        
        
        UserDefaults.standard.synchronize()
    }
    func  myAlertMessage(usermessage : String)  {
        var myAlert = UIAlertController(title: "Alert", message:usermessage, preferredStyle: UIAlertControllerStyle.alert)
        let okAction =  UIAlertAction(title: "OK",style : UIAlertActionStyle.default,handler:nil)
        myAlert.addAction(okAction)
        self.present(myAlert,animated : true,completion:nil)
    }
    
    @IBAction func registerButton(_ sender: UIButton) {
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
