//
//  feedbackViewController.swift
//  LnF V2.0
//
//  Created by Ayush Verma on 11/01/18.
//  Copyright © 2018 Ayush Verma. All rights reserved.
//

import UIKit
import MessageUI

class feedbackViewController: UIViewController,MFMailComposeViewControllerDelegate  {
    
    @IBOutlet weak var subjectTF: UITextField!
    @IBOutlet weak var messageTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func sendEmail() {
        let composeVC = MFMailComposeViewController()
        composeVC.mailComposeDelegate = self
        // Configure the fields of the interface.
        composeVC.setToRecipients(["ayush.verma2016@vitstudent.ac.in"])
                composeVC.setSubject("\(subjectTF.text!)")
                composeVC.setMessageBody("\(messageTF.text!)", isHTML: false)
        
        // Present the view controller modally.
        present(composeVC, animated: true, completion: nil)
        
        
        
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController,
                               didFinishWith result: MFMailComposeResult, error: Error?) {
        // Check the result or perform other tasks.
        // Dismisses the mail compose view controller.
        controller.dismiss(animated: true, completion: nil)
    }
    
        
        @IBAction func sendMail(_ sender: Any) {
            if subjectTF.text != "" && messageTF.text != "" {
                sendEmail()
            }
            else{
                
                let warning  = UIAlertController(title: "Some Fields Empty", message: "Please fill all the details to submit", preferredStyle: .alert)
                
                let btn1 = UIAlertAction(title: "Ok", style: .default, handler: nil)
                warning.addAction(btn1)
                
                present(warning, animated: true, completion: nil)
            }
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
