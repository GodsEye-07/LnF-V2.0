//
//  addItemsViewController.swift
//  LnF V2.0
//
//  Created by Ayush Verma on 09/01/18.
//  Copyright © 2018 Ayush Verma. All rights reserved.
//

import UIKit
import Firebase

class addItemsViewController: UIViewController {
    
    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var imageBackView: UIView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var placeTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var contactTextField: UITextField!
    @IBOutlet weak var roomTextField: UITextField!
    
    

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
    

    @IBAction func deleteButtonPressed(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
 
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        
        //check if all the field are filled or not.
        
        if titleTextField.text == "" || descriptionTextField.text == "" || contactTextField.text == "" || roomTextField.text == "" || placeTextField.text == "" {
        
            
            //checks if there is any empty field or not if so then it will display this message
            let action = UIAlertController(title: "Warning..!!", message: "Complete all the fields to proceed", preferredStyle: .alert)
            let okay = UIAlertAction(title: "OK", style: .default, handler: nil)
        
            action.addAction(okay)
        
            present(action, animated: true, completion: nil)
            
        }
        
        let x = ["title" : titleTextField.text!, "desc" : descriptionTextField.text!, "verified": false, "phone" : contactTextField.text!,"place" : placeTextField.text!, "room": roomTextField.text! ] as [String : Any]
        
        Database.database().reference().childByAutoId().setValue(x)
        
        presentingViewController?.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func addImage(_ sender: UIButton) {
        
        // adding the options to select which source to select to pick the image from
        
        
        let source = UIAlertController(title: "Select the Image", message: "add a relevant image for the item found/lost", preferredStyle: .actionSheet)
        
        let cameraOption = UIAlertAction(title: "Camera", style: .default, handler: nil)
        let galleryOption = UIAlertAction(title: "Gallery", style: .default, handler: nil)
        let cancelOption = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        source.addAction(cameraOption)
        source.addAction(galleryOption)
        source.addAction(cancelOption)
        
        present(source, animated: true, completion: nil)
        
        
        //look for the opening of camera or gallery option.
     
     
        
 
    }
    
    
    
    
//end of the class brace
}
