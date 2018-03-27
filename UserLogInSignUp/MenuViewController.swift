

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var menuTableView: UITableView!
    
    var titleArray = ["Home","About Us","Setting","Share","Rate Us","Logout"]
    var iconArray = [#imageLiteral(resourceName: "About Us"),#imageLiteral(resourceName: "Setting"),#imageLiteral(resourceName: "LogOut"),#imageLiteral(resourceName: "About Us"),#imageLiteral(resourceName: "Setting"),#imageLiteral(resourceName: "Share")] 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuTableView.dataSource = self
        menuTableView.delegate = self
        menuTableView.separatorStyle = .none

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
}
extension MenuViewController : UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = menuTableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCell
        cell.iconImage.image = iconArray[indexPath.row]
        cell.titleLabel.text = titleArray[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
        
    }
    
}
