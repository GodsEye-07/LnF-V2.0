//
//  customContactTableViewCell.swift
//  LnF V2.0
//
//  Created by Ayush Verma on 11/01/18.
//  Copyright © 2018 Ayush Verma. All rights reserved.
//

import UIKit

class customContactTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var contactImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
