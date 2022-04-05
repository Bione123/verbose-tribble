//
//  ViewController.swift
//  WhatToDrink
//
//  Created by IFTS17 on 26/02/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var imgShake: UIImageView!
    var cocktailToPass : Cocktail?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
        let imageName = "shake"
        imgShake.image = UIImage(named: imageName)
        
        let logoImage = "wine-glasses"
        logoImg.image = UIImage(named: logoImage)
       
    }
    // funzione che viene chiamata prima del perform segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detail"{
            let detailVC = segue.destination as! DetailViewController
            detailVC.drink = cocktailToPass?.drinks[0]
        }
    }
    
    // funzione che detecta il gesto di shakerare il dispositivo
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?){
        if motion == .motionShake {
            NetworkManager.getData(url: NetworkManager.share.urlRandom) { cocktail in
                print(cocktail)
                // chiamata asincrona
                DispatchQueue.main.async {
                    self.cocktailToPass = cocktail
                    // funzione che passa a un altro view controller selezionato dall'identifier
                    self.performSegue(withIdentifier: "detail", sender: nil)
                }
                
            } errore: { error in
                print(error)
            }

        }
    }
    
}

