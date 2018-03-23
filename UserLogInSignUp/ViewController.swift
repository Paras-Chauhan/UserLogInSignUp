//
//  ViewController.swift
//  UserLogInSignUp
//
//  Created by Appinventiv mac on 23/03/18.
//  Copyright © 2018 Appinventiv mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(_ animated: Bool) {
        
        let IsUserLoggedIn = UserDefaults.standard.bool(forKey: "IsUserLoggedIn")
        if(!IsUserLoggedIn){
        self.performSegue(withIdentifier: "LogIn", sender: self)
    }

}
}
