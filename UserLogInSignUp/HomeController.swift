

import UIKit

class HomeController: UIViewController {

    //Mark:- Outlets
    
    @IBOutlet var mainView: UIView!
    @IBOutlet var buttons: [UIButton]!
   
    var FirstVC: UIViewController!
    var SecondVC: UIViewController!
    var ThirdVC: UIViewController!
    var FourthVC: UIViewController!
    var FifthVC: UIViewController!
    
    var viewControllers: [UIViewController]! = []
    var selectedIndex: Int = 0
    
    var menuVC = MenuViewController()
    
   override func viewDidLoad() {
        super.viewDidLoad()
    
    Menu()
    
    //MARK:- why thread is generating over here...
    
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//
//        FirstVC = storyboard.instantiateViewController(withIdentifier: "mainView")
//        viewControllers = [FirstVC,SecondVC,ThirdVC,FourthVC,FifthVC]
//
//        buttons[selectedIndex].isSelected = true
//        didPressTab(buttons[selectedIndex])
    
    }
    
    func Menu(){
        menuVC = self.storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondsToGesture))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondsToGesture))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        
        self.view.addGestureRecognizer(swipeRight)
        self.view.addGestureRecognizer(swipeLeft)
        
    }
    
    
    @objc func respondsToGesture(gesture : UISwipeGestureRecognizer){
        switch gesture.direction{
        case UISwipeGestureRecognizerDirection.right: print("swipe Right")
            showMenu()
            //AppDelegate.menuBool = true
        case UISwipeGestureRecognizerDirection.left: print("swipe Left")
            closeOnSwipe()
        default : break
        }
    }
    
    @IBAction func didPressTab(_ sender: UIButton) {
        
        let previousIndex = selectedIndex
        selectedIndex = sender.tag
        
        buttons[previousIndex].isSelected = false
        
        
        let previousVC = viewControllers[previousIndex]
        
        // remove previous VC
        
        previousVC.willMove(toParentViewController: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParentViewController()
        
        // set current VC
        sender.isSelected = true
        let vc = viewControllers[selectedIndex]
        addChildViewController(vc)
        
        // Adjust the size to match content view
        
        vc.view.frame = mainView.bounds
        mainView.addSubview(vc.view)
        
        vc.view.frame = mainView.bounds
        mainView.addSubview(vc.view)
        vc.didMove(toParentViewController: self)
    }

    //MARK:- Action for the Buttons.
    
    
    @IBAction func menuButton(_ sender: UIButton) {
        if AppDelegate.menuBool{
            // Show Menu
            showMenu()
        }
        else{
             // Close  Menu
            closeMenu()
        }
    }
    func closeOnSwipe(){
        closeMenu()
//        if AppDelegate.menuBool{
//
//            closeMenu()
//        }
    }
   
    @IBAction func userProfilebtn(_ sender: UIButton) {
        let next = self.storyboard?.instantiateViewController(withIdentifier: "UserProfileController") as! UserProfileController
        self.navigationController?.pushViewController(next, animated: true)
    }
    
    
    @IBAction func homeButton(_ sender: UIButton) {
    }
    
    @IBAction func socialButton(_ sender: UIButton) {
    }
    
    @IBAction func radioButton(_ sender: UIButton) {
    }
    @IBAction func favouriteButton(_ sender: UIButton) {
    }
    
    @IBAction func downloadButton(_ sender: UIButton) {
    }
    
    func  showMenu() {
        UIView.animate(withDuration: 0.3) { () -> Void in
            
            self.menuVC.view.frame = CGRect(x:0,y:100,width : UIScreen.main.bounds.size.width,height : UIScreen.main.bounds.size.height)
            self.menuVC.view.backgroundColor = UIColor.black.withAlphaComponent(1)
            self.addChildViewController(self.menuVC)
            self.view.addSubview(self.menuVC.view)
          
        }
        AppDelegate.menuBool = false
    }
    func closeMenu(){
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            self.menuVC.view.frame = CGRect(x: -UIScreen.main.bounds.size.width,y:100,width : UIScreen.main.bounds.size.width,height : UIScreen.main.bounds.size.height)
            }){(finished ) in
        self.menuVC.view.removeFromSuperview()
        
        }
        AppDelegate.menuBool = true
    }
    
}

