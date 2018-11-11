//
//  Size.swift
//  Valve
//
//  Created by Carlos Santiago Cruz on 04/09/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import Foundation

enum Size: Double {
    case oneQuarter = 0.25
    case ThreeOctave = 0.375
    case oneAndHalf = 0.50
    case threeQuarter = 0.75
    case one = 1.0
    case oneOneQuarter = 1.25
    case oneOneAndHalf = 1.50
    case two = 2.0
    case twoAndHalf = 2.5
    case three = 3.0
    case four = 4.0
}

struct SizePressureReducingValve {
    var standard: Size
    var quickChange: Size
    init(standard: Size, quickChange: Size) {
        self.standard = standard
        self.quickChange = quickChange
    }
}
let size = SizePressureReducingValve(standard: .oneOneAndHalf, quickChange: .three)

enum Model: String {
    case standard = "60"
    case highPressure = "60HP"
    case quickChange = "60QC"
    case largeDiaphragm = "61"
}
enum BodyMaterial: String {
    case ductilIron = "DI"
    case bronze = "BR"
    case carbonSteel = "CS"
    case stainlessSteel = "S6"
    case castIron = "CI"
}

struct HowToOrder {
    var model: Model
    var size: Size
    var bodyMaterial: BodyMaterial
    init(model: Model, size: Size, bodyMaterial: BodyMaterial) {
        self.model = model
        self.size = size
        self.bodyMaterial = bodyMaterial
    }
}
func selectSize(accordingToModel: Model) -> String {
    switch accordingToModel {
    case .standard: return "you Select standard"
    case .highPressure: return "you select High Pressure"
    case .quickChange: return "you select Quick Change"
    case .largeDiaphragm: return "you select Large Diaphragm"
    }
}

let howToOrderValve1 = HowToOrder(model: .largeDiaphragm, size: .oneOneAndHalf , bodyMaterial: .bronze)







