//
//  contactsViewController.swift
//  LnF V2.0
//
//  Created by Ayush Verma on 09/01/18.
//  Copyright © 2018 Ayush Verma. All rights reserved.
//

import UIKit

class contactViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
 
    var list = ["Dean Office" , "Hostel Office Men's", "Hostel Office Girl's", "Papa John's" ,
                "Dominos" ,"cafe Cofee Day","Burger King","Pizza Hut","Vellore Kitchen","Barbeque Nation","Subway","SJT","T.T","CDMM","CBMR","M.B","GDN","SMVG", "etc"]
    
    var numbers = ["9833451538","7010725407","8085443407"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.shared.statusBarStyle = .default
        
        // Do any additional setup after loading the view.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! customContactTableViewCell
        
        cell.nameLabel.text = list[indexPath.row]
        cell.phoneNumberLabel.text = numbers[indexPath.row]
        cell.contactImageView.backgroundColor = UIColor(red: (CGFloat(arc4random()%255) / 255.0), green: (CGFloat(arc4random()%255) / 255.0), blue: (CGFloat(arc4random()%255) / 255.0), alpha: 1.0)
        
        cell.contactImageView.layer.cornerRadius = 40.0
        cell.clipsToBounds = true
        
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        call(x :indexPath.row)
//    }
    
    
    // takes the number from the table menu and adds it to the dialer and calls as soon as touched
    func call(x: Int) {
        if let phoneCallURL = URL(string: "tel://\(numbers[x])") {
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL)) {
                if #available(iOS 10.0, *) {
                    application.open(phoneCallURL, options: [:], completionHandler: nil)
                } else {
                    UIApplication.shared.openURL(phoneCallURL)
                }
            }
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let callAction = UITableViewRowAction(style:
            UITableViewRowActionStyle.default, title: "Call", handler: { (action,
                indexPath) -> Void in
                
                
                let confirm = UIAlertController(title: "Confirm Call", message: "call to \(self.numbers[indexPath.row])", preferredStyle: .alert)
                let button1 = UIAlertAction(title: "Ok", style: .default, handler: { (true) in
                    self.call(x: indexPath.row)
                })
                let button2 = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                
                confirm.addAction(button1)
                confirm.addAction(button2)
                
                self.present(confirm, animated: true, completion: nil)
            
                
                
        })
        
        return [callAction]
        
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

