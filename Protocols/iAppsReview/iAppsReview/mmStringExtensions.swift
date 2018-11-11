//
//  StringExtensions.swift
//  ExtensionsDemo
//
//  Copyright (c) 2017 Oak Leaf Enterprises, Inc. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
//    public func occurrencesOfString(aString: String) -> Int
//    {
//        var occurrences: Int = 0
//        // Set the initial range to the full string
//        var range: Range<String.Index>? = self.startIndex..<self.endIndex
//        
//        while range != nil
//        {
//            // Search for the string in the current range
//            range = self.rangeOfString(aString,
//                options: NSStringCompareOptions.CaseInsensitiveSearch,
//                range: range,
//                locale: nil)
//            
//            if range != nil
//            {
//                // String was found, move the range
//                range = range!.endIndex..<self.endIndex
//                // Increment the number of occurrences
//                occurrences++
//            }
//        }
//        return occurrences
//    }
    
//    // Returns a range of characters (e.g. s[0...3])
//    public subscript (r: Range<Int>) -> String {
//        
//        let start = advance(self.startIndex, r.startIndex)
//        let end = advance(self.startIndex, r.endIndex)
//        return substringWithRange(Range(start: start, end: end))
//    }
    
//    // Returns the nth character (e.g. s[1])
//    public subscript (i: Int) -> String {
//        
//        return self[i...i]
//    }
    
    // Takes a phone number in the format 1234567890 or 1234567 
    // and returns (123) 456-7890 or 456-7890
//    public func formatPhone() -> String {
//        
//        let cnt = count(self)
//        var phoneString = self
//        if cnt == 10 {
//            phoneString.insert("(", atIndex: phoneString.startIndex)
//            phoneString.insert(")", atIndex: advance(phoneString.startIndex, 4))
//            phoneString.insert(" ", atIndex: advance(phoneString.startIndex, 5))
//            phoneString.insert("-", atIndex: advance(phoneString.startIndex, 9))
//        }
//        else if cnt == 7 {
//            phoneString.insert("-", atIndex: advance(phoneString.startIndex, 3))
//        }
//        return phoneString
//    }
    
    // Returns the text between the specified element (don't specify angle brackets). 
    // NOTE: Assumes  a single element of the specified name! Meant for parsing a single XML "record"
    public func getTextBetweenXMLElement(_ xmlElement: String) -> String {
        
        var text = ""
        
        let startRange =  self.range(of: "<\(xmlElement)>")
        if let start = startRange {
            let sub = self[start.upperBound...]
            let endRange = sub.range(of: "</\(xmlElement)>")
            if let end = endRange {
				text = String(sub[...end.lowerBound])
            }
        }
        
        return text
    }
    
    // Checks if the string is nil or empty (after trimming white space)
    public static func isNilOrEmpty(_ string: String?) -> Bool {
        
        switch string?.trimmingCharacters(in: CharacterSet.whitespaces) {
        case .some(let nonNilString):
            return nonNilString.isEmpty
        default:
            return true
        }
    }
    
    // Replaces the pathExtension property removed from String in Swift 2.0
    var pathExtension: String {
        
        get {
            return (self as NSString).pathExtension
        }
    }
}



