//
//  NetworkTests.swift
//  LabTunesTests
//
//  Created by Carlos Santiago Cruz on 09/11/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import XCTest
@testable import LabTunes

class NetworkTests: XCTestCase {
    var sessionUnderTest: URLSession!
    
    override func setUp() {
        super.setUp()
        sessionUnderTest = URLSession(configuration: .default)
    }
    func testValidCallToItunes() {
        let url = URL(string: "https://itunes.apple.com/search?media=music&entity=song&term=Queen")
        var statusCode: Int?
        var responseError: Error?
        let promise = expectation(description: "handler Invoked")
        let dataTask = sessionUnderTest.dataTask(with: url!) {
            data, response, error in
            statusCode = (response as? HTTPURLResponse)?.statusCode
            responseError = error
            promise.fulfill()
        }
        dataTask.resume()
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNil(responseError)
        XCTAssertEqual(statusCode, 200)
    }
    func testSlowValidCallToItunes(){
        let url = URL(string: "https://itunes.apple.com/search?media=music&entity=song&term=Queen")
        let promise = expectation(description: "Status code:200")
        let dataTask = sessionUnderTest.dataTask(with: url!) {data, response, error in
            if let error = error {
                XCTFail("Error: (\(error.localizedDescription)")
            } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                if statusCode == 200 {
                    promise.fulfill()
                } else {
                    XCTFail("Status code: \(statusCode)")
                }
            }
        }
        dataTask.resume()
        waitForExpectations(timeout: 5, handler: nil)
    }
    
}
