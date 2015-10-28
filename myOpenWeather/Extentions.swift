//
//  Extentions.swift
//  myOpenWeather
//
//  Created by Ronny Soltveit on 29/10/15.
//  Copyright © 2015 Ronny Soltveit. All rights reserved.
//

import Foundation

extension NSDate
{
    func hour() -> Int
    {
        //Get Hour
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components(.Hour, fromDate: self)
        let hour = components.hour
        
        //Return Hour
        return hour
    }
    
    
    func minute() -> Int
    {
        //Get Minute
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components(.Minute, fromDate: self)
        let minute = components.minute
        
        //Return Minute
        return minute
    }
}