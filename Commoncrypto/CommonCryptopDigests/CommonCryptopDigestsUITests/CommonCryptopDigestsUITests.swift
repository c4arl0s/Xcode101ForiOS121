//
//  CommonCryptopDigestsUITests.swift
//  CommonCryptopDigestsUITests
//
//  Created by Carlos Santiago Cruz on 06/10/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import XCTest

class CommonCryptopDigestsUITests: XCTestCase {
     let lipsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur dapibus consectetur finibus. Proin gravida velit ac facilisis tincidunt. Quisque eu ultrices tellus. Maecenas lacinia tincidunt nisl, ac sodales odio pulvinar vitae. Aliquam elementum quis massa a luctus. Praesent eleifend sit amet dolor in feugiat. Proin sollicitudin sapien eget sollicitudin gravida. Fusce tempor nec diam non semper. Aliquam erat volutpat. Donec dolor massa, fringilla a tellus quis, dapibus lacinia quam. Integer eget efficitur tellus. Sed vestibulum rutrum lacus, eget malesuada lacus hendrerit quis. Phasellus sem lectus, volutpat nec felis et, egestas mollis enim."
    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testsha1() {
        let result = Checksums.sha1(string: lipsum)
        XCTAssertEqual("",result)
    }
    
}
