//
//  DrinkTableViewCell.swift
//  WhatToDrink
//
//  Created by IFTS17 on 17/03/22.
//

import UIKit

class DrinkTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgDrink : UIImageView!
    @IBOutlet weak var lblDrink : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
