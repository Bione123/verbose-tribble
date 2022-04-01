//
//  Cocktail.swift
//  WhatToDrink
//
//  Created by IFTS17 on 16/03/22.
//

import Foundation
import UIKit

/*
 Decodable: permette di decodificare una rappresentazione esterna, come un JSON, in una rappresentazione interna (da JSON alla class/struct conforme a questo protocollo).
 Encodable: permette la codifica di una rappresentazione interna, un nostro oggetto, in una rappresentazione esterna come può essere un JSON.
 Codable: entrambe le cose
 */
struct Cocktail: Codable {
    var drinks: [Drink]
}

struct Drink : Codable{
    var strDrink: String
    var strDrinkThumb: String
    var strIngredient1: String?
    var strIngredient2: String?
    var strIngredient3: String?
    var strIngredient4: String?
    var strIngredient5: String?
    var strMeasure1: String?
    var strMeasure2: String?
    var strMeasure3: String?
    var strMeasure4: String?
    var strMeasure5: String?
    var strInstructionsIT: String?
}
