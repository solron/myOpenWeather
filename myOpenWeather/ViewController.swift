//
//  ViewController.swift
//  myOpenWeather
//
//  Created by Ronny Soltveit on 26/10/15.
//  Copyright © 2015 Ronny Soltveit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tempLbl: UILabel!
    
    var myWeather = MyWeather()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myWeather.downloadWeather { () -> () in
            self.updateUI()
        }
    }
    
    func updateUI() {
        tempLbl.text = myWeather.temperature
        print(myWeather.temperature)
    }

}

