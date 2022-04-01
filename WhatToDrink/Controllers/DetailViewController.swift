//
//  ShakeViewController.swift
//  WhatToDrink
//
//  Created by IFTS17 on 18/03/22.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {
    
    @IBOutlet weak var drinkImg: UIImageView!
    @IBOutlet weak var drinkDesc: UITextView!
    @IBOutlet weak var drinkName: UILabel!
    @IBOutlet weak var drinkIng: UITextView!
    var cocktail : Cocktail?
    var drink : Drink?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup(){
        if let drink = drink {
            if let measure1 = drink.strMeasure1 , let measure2 = drink.strMeasure2, let ing1 = drink.strIngredient1, let ing2 = drink.strIngredient2 {
                drinkIng.text = measure1 + " " + ing1 + " " + measure2 + " " + ing2
            }
            
            
            drinkDesc.text = drink.strInstructionsIT
            drinkName.text = drink.strDrink
            
            let urlString = drink.strDrinkThumb
            let url = URL(string: urlString)
            drinkImg.kf.setImage(with: url)
        }else{
            print("NO DRINK")
        }
        
    }
}
