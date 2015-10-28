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
    @IBOutlet weak var sunriseLbl: UILabel!
    @IBOutlet weak var sunsetLbl: UILabel!
    @IBOutlet weak var humidityLbl: UILabel!
    @IBOutlet weak var windSpeedLbl: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    
    var myWeather = MyWeather(city: "Kvernaland")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myWeather.downloadWeather { () -> () in
            self.updateUI()
        }
    }
    
    func updateUI() {
        tempLbl.text = myWeather.temperature
        humidityLbl.text = myWeather.humidity
        windSpeedLbl.text = myWeather.wind
        sunriseLbl.text = myWeather.sunrise
        sunsetLbl.text = myWeather.sunset
        weatherIcon.image = UIImage(named: myWeather.iconImage)
    }

}

