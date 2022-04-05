//
//  InfoViewController.swift
//  WhatToDrink
//
//  Created by IFTS17 on 04/04/22.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var infoImg: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        let imageName = "wine-glasses"
        infoImg.image = UIImage(named: imageName)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
