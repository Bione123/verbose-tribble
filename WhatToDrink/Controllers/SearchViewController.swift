//
//  SearchViewController.swift
//  WhatToDrink
//
//  Created by IFTS17 on 17/03/22.
//

import UIKit

class SearchViewController : UIViewController ,UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var BarraRicerca: UISearchBar!
    
    @IBOutlet weak var CocktailList: UITableView!
    
    var drinkToPass : Drink?
    var cocktail : Cocktail?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.CocktailList.keyboardDismissMode = .onDrag
        CocktailList.delegate = self
        CocktailList.dataSource = self
        BarraRicerca.delegate = self
        // reloadData richiama le due funzioni tableview nel caso i dati siano modificati
        CocktailList.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        BarraRicerca.becomeFirstResponder()
    }
    // ritorno tanti drink quanti ce ne sono nell'array drinks che all'inizio è vuoto
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cocktail?.drinks.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CocktailList.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DrinkTableViewCell
        if let cocktail = cocktail {
            cell.lblDrink.text = cocktail.drinks[indexPath.row].strDrink
        }
        return cell
    }
    // funzione per la barra di ricerca che filtra i cocktail per nome
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if let search = searchBar.text {
            let urlString = NetworkManager.share.urlSearch + search
            let url = URL(string: urlString)!
            print(url,search)
            NetworkManager.getData(url: url) { Bevanda in
                print(Bevanda.drinks.count)
                self.cocktail = Bevanda
                DispatchQueue.main.async {
                    self.CocktailList.reloadData()
                }
                
            } errore: { error in
                print(error)
            }

        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        drinkToPass = cocktail?.drinks[indexPath.row]
        
        self.performSegue(withIdentifier: "dettagli", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "dettagli" {
            let detailVC = segue.destination as! DetailViewController
            detailVC.drink = drinkToPass
        }
    }

}
