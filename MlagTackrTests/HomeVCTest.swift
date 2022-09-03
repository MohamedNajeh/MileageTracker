//
//  HomeVCTest.swift
//  MlagTackrTests
//
//  Created by Najeh on 03/09/2022.
//

import XCTest
import CoreLocation
@testable import MlagTackr
class HomeVCTest: XCTestCase {

    var trips:[Trip] = []
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        trips = []
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testAddingTripFunc(){
        let loc11 = CLLocationCoordinate2D.init(latitude: 40.741895, longitude: -73.989308)
        let loc22 = CLLocationCoordinate2D.init(latitude: 40.728448, longitude: -73.717996)
        let trip = Trip(title: "Trip", firstLocation: loc11, lastLocation: loc22)
        self.trips.append(trip)
        XCTAssertTrue(self.trips.count > 0)
    }

}
