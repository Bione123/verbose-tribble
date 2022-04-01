//
//  NetworkManager.swift
//  WhatToDrink
//
//  Created by IFTS17 on 26/02/22.
//

import Foundation
import UIKit

class NetworkManager {
    // funzione che richiama le API
    static let share = NetworkManager()
    // ho due API una che richiama un cocktail random e una che serve per la funzione di ricerca per nome
    let urlRandom : URL = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/random.php")!
    let urlSearch =  "https://www.thecocktaildb.com/api/json/v1/1/search.php?s="
    public static func getData(url: URL, ok: @escaping (Cocktail)->Void, errore: @escaping (Error)->Void) {
       
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) {
            (data, response, error) in
            // controllo se c'è un errore e in caso lo stampo in console
            if error != nil{
                errore(error!)
                print(error)
            }else{
                //se invece ho i dati uso json decoder per gestirli e leggerli
                if let data = data {
                    let decoder = JSONDecoder()
                    if let dataDecoded = try? decoder.decode(Cocktail.self, from: data){
                        ok(dataDecoded)
                    }
                   
                }
            }
            
        }
        task.resume()
    }
}

