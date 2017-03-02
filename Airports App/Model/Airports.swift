//
//  Airports.swift
//  Airports App
//
//  Created by kumaran V on 02/03/17.
//  Copyright © 2017 Kumaran. All rights reserved.
//

import UIKit
import ObjectMapper

class Airports: Mappable {
    var airportsArray: [Airport]?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        airportsArray <- map["airports"]
    }
}
class Airport: Mappable {
    
    var code: String?
    var currency_code: String?
    var display_name: String?
    var international_airport: Bool?
    var regional_airport: Bool?
    var timezone: String?
    var country: String?
    var latitude: Double?
    var longitude: Double?
    
    //for unit testing purpose
    init?(map: String){
        
    }
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        code <- map["code"]
        currency_code <- map["currency_code"]
        display_name <- map["display_name"]
        international_airport <- map["international_airport"]
        regional_airport <- map["regional_airport"]
        timezone <- map["timezone"]
        country <- map["country.display_name"]
        latitude <- map["location.latitude"]
        longitude <- map["location.longitude"]
    }
    
    func validateLatitude(latitude: Double) -> Bool
    {
        if -90 ... +90 ~= latitude{
            return true}
        else{
            return false}
    }
    
    func validateLongitude(longitude: Double) -> Bool
    {
        if 0 ... +180 ~= longitude{
            return true}
        else{
            return false}
    }
}
