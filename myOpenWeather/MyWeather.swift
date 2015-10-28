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
    private var _humidity: String!
    private var _wind: String!
    private var _sunrise: String!
    private var _sunset: String!
    private var _iconImage: String!
    private var _apiUrl: String!
    
    var temperature: String {
        if _temperature == nil {
            _temperature = ""
        }
        return _temperature
    }
    
    var humidity: String {
        if _humidity == nil {
            _humidity = ""
        }
        return _humidity
    }
    
    var wind: String {
        if _wind == nil {
            _wind = ""
        }
        return _wind
    }
    
    var sunrise: String {
        if _sunrise == nil {
            _sunrise = ""
        }
        return _sunrise
    }
    
    var sunset: String {
        if _sunset == nil {
            _sunset = ""
        }
        return _sunset
    }
    
    var iconImage: String {
        if _iconImage == nil {
            _iconImage = ""
        }
        return _iconImage
    }
    
    init(city: String) {
        self._city = city //"Kvernaland"
        _apiUrl = "\(URL_BASE)\(_city)\(API_KEY)"
    }
    
    func downloadWeather(completed: DownloadComplete) {
        let url = NSURL(string: _apiUrl)!
        Alamofire.request(.GET, url).responseJSON { response in
            if let dict = response.result.value as? Dictionary<String, AnyObject> {
                
                if let weather = dict["main"] as? Dictionary<String, Double> where weather.count > 0 {
                    if let temp1 = weather["temp"] {
                        let temp = Int(temp1) - 273
                        self._temperature = "\(temp)°C"
                    }
                    if let hum1 = weather["humidity"] {
                        let hum = Int(hum1)
                        self._humidity = "\(hum)%"
                    }
                }
                if let weather = dict["wind"] as? Dictionary<String, Double> where weather.count > 0 {
                    if let wind1 = weather["speed"] {
                        let wind = Int(wind1)
                        self._wind = "\(wind)m/s"
                    }
                }
                if let weather = dict["sys"] as? Dictionary<String, AnyObject> where weather.count > 0 {
                    if let sunrise1 = weather["sunrise"] as? NSNumber {
                        let sunrise = NSDate(timeIntervalSince1970: Double(sunrise1))   //sunrise1
                        self._sunrise = "\(sunrise.hour()):\(sunrise.minute())"
                    }
                    if let sunset1 = weather["sunset"] as? NSNumber {
                        let sunset = NSDate(timeIntervalSince1970: Double(sunset1))
                        self._sunset = "\(sunset.hour()):\(sunset.minute())"
                    }
                }
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] {
                    if let icon = weather[0]["icon"] as? NSString {
                        // Images: Sun, Rain, Partly, Cloud
                        // Does not contain night icons yet
                        switch icon {
                        case "01d", "01n":
                            self._iconImage = "sun"
                        case "02d", "02n":
                            self._iconImage = "partly"
                        case "03d", "03n", "04d", "04n":
                            self._iconImage = "cloud"
                        default:
                            self._iconImage = "rain"
                        }
                    }
                }
                completed()
            }
        }
    }
    
}