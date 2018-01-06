//
//  ViewController.swift
//  LnF V2.0
//
//  Created by Ayush Verma on 06/01/18.
//  Copyright © 2018 Ayush Verma. All rights reserved.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
         let animationView = LOTAnimationView(name: "email")
            animationView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
            animationView.center = self.view.center
            animationView.contentMode = .scaleAspectFill

            view.addSubview(animationView)
            animationView.loopAnimation  = true
            animationView.play()
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

