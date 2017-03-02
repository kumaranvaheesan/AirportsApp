//
//  ApiClient.swift
//  Airports App
//
//  Created by kumaran V on 02/03/17.
//  Copyright © 2017 Kumaran. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

let APIURL:String = "https://www.qantas.com.au/api/airports"

class ApiClient: NSObject {
    
    func getAllAirports()
    {
        Alamofire.request(APIURL).responseObject { (response: DataResponse<Airports>) in
            switch(response.result) {
            case .success(_):
                let airportsResponse = response.result.value
                
                if let airportsArray = airportsResponse?.airportsArray {
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "AirportsListReceivedNotification"), object: airportsArray)
                    
                }
                break
                
            case .failure(_):
                print ("failed to fetch")
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "AirportsListFetchFailed"), object: nil)
                break
                
            }
            
        }
    }
    
    
}
