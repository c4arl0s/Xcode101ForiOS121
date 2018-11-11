//
//  Size.swift
//  HowToOrderPRVMK60
//
//  Created by Carlos Santiago Cruz on 04/10/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//
import Foundation
import UIKit

enum Size: String {
    case oneQuarter = "025"
    case ThreeOctave = "038"
    case oneAndHalf = "050"
    case threeQuarter = "075"
    case one = "100"
    case oneOneQuarter = "125"
    case oneOneAndHalf = "150"
    case two = "200"
    case twoAndHalf = "250"
    case three = "300"
    case four = "400"
    
    var feature: String {
        switch self {
        case .oneQuarter: return "1/4 inch (DN8)"
        case .ThreeOctave: return "3/8 inch (DN10)"
        case .oneAndHalf: return "1/2 inch (DN15)"
        case .threeQuarter: return "3/4 inch (DN20)"
        case .one: return "1 inch (DN25)"
        case .oneOneQuarter: return "1-1/4 inch (DN32)"
        case .oneOneAndHalf: return "1-1/2 inch (DN40)"
        case .two: return "2 inch (DN50)"
        case .twoAndHalf: return "2-1/2 inch (DN65) (MK60/60HP only)"
        case .three: return "3 inch (DN80) (MK60/60HP only)"
        case .four: return "4 inch (DN100) (MK60/60HP only)"
        }
    }
}
