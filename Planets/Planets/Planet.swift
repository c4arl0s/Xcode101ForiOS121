//
//  Planet.swift
//  Planets
//
//  Created by Carlos Santiago Cruz on 18/08/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import Foundation

enum Planet {
    case Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune, Pluto
    
    var distanceFromSunKm: Double {
        switch self {
        case .Mercury:
            return 57900000
        case .Venus:
            return 108200000
        case .Earth:
            return 149600000
        case .Mars:
            return 227900000
        case .Jupiter:
            return 77830000
        case .Saturn:
            return 1427000000
        case .Uranus:
            return 2871000000
        case .Neptune:
            return 4497100000
        case .Pluto:
            return 5913000000
        }
    }
    var distanceFromSunAU: Double {
        return self.distanceFromSunKm/149700598.80239
    }
    func distanceFromAU (otherPlanet: Planet) -> Double {
        return (self.distanceFromSunAU - otherPlanet.distanceFromSunAU).magnitude
    }
    func distanceFromKm (otherPlanet: Planet) -> Double {
        return (self.distanceFromSunKm - otherPlanet.distanceFromSunKm).magnitude
    }
    var distanceFromEarthKm: Double {
        return (self.distanceFromSunKm - Planet.Earth.distanceFromSunKm).magnitude
    }
    var distanceFromEarthAU: Double {
        return (self.distanceFromSunAU - Planet.Earth.distanceFromSunAU).magnitude
    }
}
