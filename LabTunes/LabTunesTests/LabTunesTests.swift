//
//  LabTunesTests.swift
//  LabTunesTests
//
//  Created by Carlos Santiago Cruz on 09/11/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import XCTest
@testable import LabTunes

class LabTunesTests: XCTestCase {
    
    override func setUp() {
        let session = Session.sharedInstance
        session.token = nil
        
    }
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    func testCorrectLogin () {
        XCTAssertTrue(User.login(userName: "iOSLab", password: "test"))
    }
    func testWrongTest () {
        XCTAssertFalse(User.login(userName: "Carlos", password: ""))
    }
    func testSaveSession(){
        let session = Session.sharedInstance
        let _ = User.login(userName: "iOSLab", password: "223")
        XCTAssertNotNil(session.token)
    }
    func testSessionNil() {
        let session = Session.sharedInstance
        let _ = User.login(userName: "Jorge", password: "223")
        XCTAssertNil(session.token)
    }
    func testExpectedToken() {
        let session = Session.sharedInstance
        let _ = User.login(userName: "iOSLab", password: "223")
        XCTAssertEqual(session.token!,"123456789", "Token Should Match")
        //XCTAssertNotEqual Probar de tarea
    }
//    func testThrowsError {
//        XCTAssertThrowsError(try User.fetchSongs())
//    }
    
    func testMusicSongs(){
        var resultSongs: [Song] = []
        let promise = expectation(description: "Songs Downloaded")
        Music.fetchSongs { (songs) in
            resultSongs = songs
            promise.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotEqual(resultSongs.count, 0)
    }
    
}
