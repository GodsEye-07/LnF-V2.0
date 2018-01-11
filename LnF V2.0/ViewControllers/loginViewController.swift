//
//  loginViewController.swift
//  LnF V2.0
//
//  Created by Ayush Verma on 09/01/18.
//  Copyright © 2018 Ayush Verma. All rights reserved.
//

import UIKit

class loginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.shared.statusBarStyle = .lightContent
        
        
        self.resignFirstResponder()
        self.view.endEditing(true)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

    
//end of the class brace
}
