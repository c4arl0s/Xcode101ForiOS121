//
//  CommonCryptoDigestsTests.swift
//  CommonCryptoDigestsTests
//
//  Created by Luis Ezcurdia on 10/6/18.
//  Copyright © 2018 Luis Ezcurdia. All rights reserved.
//

import XCTest
@testable import CommonCryptoDigests

class CommonCryptoDigestsTests: XCTestCase {
    
    let lipsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam et orci congue, ultrices dolor id, ultrices sapien. Aliquam erat volutpat. Nullam at justo ullamcorper, elementum erat quis, dictum lorem. Nulla at turpis ac tellus convallis aliquam. Morbi et nisl congue, dapibus quam at, vestibulum tellus. Aenean mauris tortor, scelerisque quis neque vel, iaculis lacinia augue. Sed congue convallis massa. Praesent fringilla dolor enim, in pretium magna tristique vitae. Proin a turpis a sem lobortis cursus. Sed commodo placerat vulputate. Ut nec commodo velit. Aliquam convallis, velit in venenatis ornare, tortor erat tincidunt ligula, eu rutrum orci nunc eget libero."


    func testSha1() {
        self.measure {
            let result = Digests.sha1(string: lipsum)
//            let result = CDDigests.sha1String(lipsum)
            XCTAssertEqual("d1107c87551bd10cd000220f0061a41aa04c96f4", result)
        }
    }
    
    func testSha256() {
        self.measure {
            let result = Digests.sha256(string: lipsum)
//            let result = CDDigests.sha256String(lipsum)
            XCTAssertEqual("8bb6f55aa8a07c7ac343de0d15dac2dca1b1709624c1cdb17bf44f29fc276630", result)
        }
    }
    
    func testSha1Integrity() {
        let swiftResult = Digests.sha1(string: lipsum)
        let objcResult = CDDigests.sha1String(lipsum)
        XCTAssertEqual(objcResult, swiftResult)
    }
}
