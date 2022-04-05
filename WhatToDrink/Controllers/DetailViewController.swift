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
            if let measure1 = drink.strMeasure1, let ing1 = drink.strIngredient1 {
                drinkIng.text = measure1 + ing1
            }
            if let measure2 = drink.strMeasure2, let ing2 = drink.strIngredient2 {
                drinkIng.text += ", " + measure2 + ing2
            }
            if let measure3 = drink.strMeasure3, let ing3 = drink.strIngredient3 {
                drinkIng.text += ", " + measure3 + ing3
            }
            if let measure4 = drink.strMeasure4, let ing4 = drink.strIngredient4 {
                drinkIng.text += ", " + measure4 + ing4
            }
            if let measure5 = drink.strMeasure5, let ing5 = drink.strIngredient5 {
                drinkIng.text += ", " + measure5 + ing5
            }
            if let measure6 = drink.strMeasure6, let ing6 = drink.strIngredient6 {
                drinkIng.text += ", " + measure6 + ing6
            }
            if let measure7 = drink.strMeasure7, let ing7 = drink.strIngredient7 {
                drinkIng.text += ", " + measure7 + ing7
            }
            if let measure8 = drink.strMeasure8, let ing8 = drink.strIngredient8 {
                drinkIng.text += ", " + measure8 + ing8
            }
            if let measure9 = drink.strMeasure9, let ing9 = drink.strIngredient9 {
                drinkIng.text += ", " + measure9 + ing9
            }
            if let measure10 = drink.strMeasure10, let ing10 = drink.strIngredient10 {
                drinkIng.text += ", " + measure10 + ing10
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
