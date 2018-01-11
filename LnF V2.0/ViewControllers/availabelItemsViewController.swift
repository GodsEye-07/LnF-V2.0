//
//  availabelItemsViewController.swift
//  LnF V2.0
//
//  Created by Ayush Verma on 09/01/18.
//  Copyright © 2018 Ayush Verma. All rights reserved.
//

import UIKit
import Firebase

class availabelItemsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var lostItems = [NSDictionary]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        UIApplication.shared.statusBarStyle = .default
        
        self.title = "Items"
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        
        tableView.reloadData()
        fetchData()

        
    }
    
//   to fetch all the data that has been saved in the backend and to show it here
    
    func fetchData() {
        
        Database.database().reference().observe(.value, with: {snap in
            print(snap)
            
            self.lostItems.removeAll()
            let x = snap.children.allObjects as! [DataSnapshot]
            for i in x {
                let j = i.value as! Dictionary<String,AnyObject>
                if j["verified"] as! Bool == true {
                    self.lostItems.append(j as NSDictionary)
                }
                if i == x.last {
                    self.tableView.reloadData()
                }
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lostItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! customTableViewCell
        
        
        cell.titleLabel.text = "\(lostItems[indexPath.row]["title"]!)"
        cell.placeLabel.text = "\(lostItems[indexPath.row]["place"]!)"
        cell.descriptionLabel.text = "\(lostItems[indexPath.row]["desc"]!)"
        
        return cell
        
    }
    
    
    // to be shareable at facebook and twitter 
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        // Social Sharing Button
        let shareAction = UITableViewRowAction(style:
            UITableViewRowActionStyle.default, title: "Share", handler: { (action,
                indexPath) -> Void in
                let defaultText = "Just checking in at " + String(describing: self.lostItems[indexPath.row]["title"]!)
                let activityController = UIActivityViewController(activityItems:
                    [defaultText], applicationActivities: nil)
                self.present(activityController, animated: true, completion: nil)
     
        })
        
        shareAction.backgroundColor = UIColor(red: 48.0/255.0, green: 173.0/255.0,
                                              blue: 99.0/255.0, alpha: 1.0)
       
        return [shareAction]
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
    

    

    
    
//end of the class brace
}
