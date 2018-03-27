

import UIKit

class RegisterPageController: UIViewController {

    //MARK:- Outlets
    
    @IBOutlet weak var resgisterTitle: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPasswordLabel: UILabel!
    @IBOutlet weak var confirmPasswordField: UITextField!
   
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

    @IBAction func registerButton(_ sender: UIButton) {
     let userEmail = emailField.text
        let userPassword = passwordField.text
     let userConfirmPassword = confirmPasswordField.text
      
        //Check for empty Fields
        if((userEmail?.isEmpty)! || (userPassword?.isEmpty)!){
            //Display alert message
            myAlertMessage(usermessage: "All fields are Empty")
            return
        }
        //Check if password matches.
        if(userPassword != userConfirmPassword!){
            //Display alert message
            myAlertMessage(usermessage: "Password is not Same!!!")
            return
        }
        // Store Data
        UserDefaults.standard.set(userEmail, forKey :"userEmail")
        UserDefaults.standard.set(userPassword, forKey :"userPassword")
        UserDefaults.standard.synchronize()
        
        //Display alert message with confirmation.
        myAlertMessage(usermessage: "Register SuccessFully!!")
    }
    func  myAlertMessage(usermessage : String)  {
        let myAlert = UIAlertController(title: "Alert", message:usermessage, preferredStyle: UIAlertControllerStyle.alert)
        let okAction =  UIAlertAction(title: "OK",style : UIAlertActionStyle.default,handler:nil)
        myAlert.addAction(okAction)
        self.present(myAlert,animated : true,completion:nil)
    }
    
    @IBAction func haveAccountButton(_ sender: UIButton) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
