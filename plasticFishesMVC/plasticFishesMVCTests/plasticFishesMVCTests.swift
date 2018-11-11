//
//  plasticFishesMVCTests.swift
//  plasticFishesMVCTests
//
//  Created by Carlos Santiago Cruz on 14/09/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import XCTest
@testable import plasticFishesMVC

struct DataSource {
    static func fishes() -> [Bool] {
        print("hello")
        return [true]
    }
}

class plasticFishesMVCTests: XCTestCase {
   
    func testExample() {
        let fishes = DataSource.fishes()
        XCTAssertNotNil(fishes)
        XCTAssertEqual(1, fishes.count, "you must have one fish into array")
    }
    
    //func testPerformanceExample() {
        // This is an example of a performance test case.
      //  self.measure {
            // Put the code you want to measure the time of here.
        //}
    //}
    
}
