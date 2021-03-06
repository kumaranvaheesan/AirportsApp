//
//  Airports_AppTests.swift
//  Airports AppTests
//
//  Created by kumaran V on 02/03/17.
//  Copyright © 2017 Kumaran. All rights reserved.
//

import XCTest
import ObjectMapper

@testable import Airports_App

class Airports_AppTests: XCTestCase {
    let airport = Airport(map: "")

    override func setUp() {
        super.setUp()
      
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    
    func testValidateLatitude()
    {
        
        XCTAssertEqual(airport?.validateLatitude(latitude: -22.00), true, "Negative Latitude Within Range")
        XCTAssertEqual(airport?.validateLatitude(latitude: 122.00), false, "Latitude greater than 90")


    }
    func testValidateLongitude()
    {
        
        XCTAssertEqual(airport?.validateLongitude(longitude : -22.00), false, "Negative Longitude")
        XCTAssertEqual(airport?.validateLongitude(longitude: 56.999), true, "Valid Longitude")
        
    }

    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
