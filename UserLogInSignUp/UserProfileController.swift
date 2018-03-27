

import UIKit

class UserProfileController: UIViewController {

    //MARK:- OUTLETS
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var gaanaUserLabel: UILabel!
    @IBOutlet weak var freeUserLabel: UILabel!
    @IBOutlet weak var mainTableView: UITableView!
   
    @IBAction func StartFreeButton(_ sender: UIButton) {
    }
    @IBAction func doneButton(_ sender: UIButton) {
        
    }
    
    
    var titleArray : Array = ["Settings","Account","Music Playback","Display","Gaana Plus & Rewards","Application","FAQs"]
    
    var optionArray : Array = ["Display Mode","edit Profile ,Manage Devices, Social Settings","Music Language,Music Quality,Autoplay,Explicit Content","Display Language,High Resolution Images,App Theme","","Push Notifications,Rate App,Share App,About Us",""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
       
      
    }
    
}

  extension UserProfileController: UITableViewDelegate,UITableViewDataSource{
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mainTableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! UserProfileCell
        cell.titleLabel.text = titleArray[indexPath.row]
        cell.optionsLabel.text = optionArray[indexPath.row]
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}
