//
//  MyWeather.swift
//  myOpenWeather
//
//  Created by Ronny Soltveit on 27/10/15.
//  Copyright © 2015 Ronny Soltveit. All rights reserved.
//

import Foundation
import Alamofire

class MyWeather {
    private var _city: String!
    private var _temperature: String!
    private var _apiUrl: String!
    
    var temperature: String {
        if _temperature == nil {
            _temperature = ""
        }
        return _temperature
    }
    
    init() {
        self._city = "Kvernaland"
        _apiUrl = "\(URL_BASE)\(_city)\(API_KEY)"
    }
    
    func downloadWeather(completed: DownloadComplete) {
        let url = NSURL(string: _apiUrl)!
        Alamofire.request(.GET, url).responseJSON { response in
            if let dict = response.result.value as? Dictionary<String, AnyObject> {
                if let weather = dict["main"] as? Dictionary<String, Double> where weather.count > 0 {
                    if let temp1 = weather["temp"] {
                        let temp = Int(temp1) - 273
                        self._temperature = "\(temp)"
                    }
                }
            }
        }
    }
    
}