//
//  BodyMaterial.swift
//  HowToOrderPRVMK60
//
//  Created by Carlos Santiago Cruz on 04/10/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//



enum BodyMaterial: String {
    case DultilIron = "DI"
    case Bronze = "BR"
    case CarbonSteel = "CS"
    case StainlessSteel = "S6"
    case CastIron = "CI"
    
    var feature: String {
        switch self {
        case .DultilIron: return "Ductil Iron"
        case .Bronze: return "Bronze"
        case .CarbonSteel: return "Carbon Steel"
        case .StainlessSteel: return "Stainless Steel"
        case .CastIron: return "Cast Iron"
        }
    }
}
