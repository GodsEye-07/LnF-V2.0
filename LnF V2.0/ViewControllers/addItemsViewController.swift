//
//  addItemsViewController.swift
//  LnF V2.0
//
//  Created by Ayush Verma on 09/01/18.
//  Copyright © 2018 Ayush Verma. All rights reserved.
//

import UIKit

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
        
     if titleTextField.text == "" || descriptionTextField.text == "" || contactTextField.text == "" || roomTextField.text == "" || placeTextField.text == "" {
        
            
            //checks if there is any empty field or not if so then it will display this message
            let action = UIAlertController(title: "Warning..!!", message: "Complete all the fields to proceed", preferredStyle: .alert)
            let okay = UIAlertAction(title: "OK", style: .default, handler: nil)
            action.addAction(okay)
            
        }
        
    }
    
    @IBAction func addImage(_ sender: UIButton) {
        
            if
                UIImagePickerController.isSourceTypeAvailable(.camera){
            let imagePicker = UIImagePickerController()
            imagePicker.allowsEditing = false
            imagePicker.sourceType = .photoLibrary
            present(imagePicker, animated: true, completion: nil)
        }
            else{
                
                UIImagePickerController.isSourceTypeAvailable(.photoLibrary)
                let imagePick = UIImagePickerController()
                imagePick.allowsEditing = false
                imagePick.sourceType = .photoLibrary
                present(imagePick, animated: true, completion: nil)
                
        }
        
        
        
    }
    
    
    
    
//end of the class brace
}
