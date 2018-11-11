//
//  extension.swift
//  Worldb
//
//  Created by Carlos Santiago Cruz on 06/10/18.
//  Copyright © 2018 Luis Ezcurdia. All rights reserved.
//

import Foundation

extension Data {
    func base64() -> String {
        return self.base64EncodedString(options: .lineLength64Characters)
    }
    
    func sha1() -> String {
        var digest = [UInt8](repeating: 0, count: Int(CC_SHA1_DIGEST_LENGTH))
        self.withUnsafeBytes {
            _ = CC_SHA1($0, CC_LONG(self.count), &digest)
        }
        return digest.map { String(format: "%02hhx", $0) }.joined()
    }
    
    func sha256() -> String {
        var hashData = Data(count: Int(CC_SHA256_DIGEST_LENGTH))
        _ = hashData.withUnsafeMutableBytes { digestBytes in
            self.withUnsafeBytes { messageBytes in
                CC_SHA256(messageBytes, CC_LONG(self.count), digestBytes)
            }
        }
        return hashData.map { String(format: "%02hhx", $0) }.joined()
    }
}
