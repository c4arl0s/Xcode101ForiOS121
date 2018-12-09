//
//  ViewController.swift
//  OptionalChaining
//
//  Created by Carlos Santiago Cruz on 12/9/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // lets create an instance of Person
        let person = Person(age: 35, residence: Residence(address: Address(buildingNumber: "B-12", streetName: "Tezonco", apartmentNumber: "3-D")))
        
        if let theResidence = person.residence {
            if let theAddress = theResidence.address {
                if let theApartmentNumber = theAddress.apartmentNumber {
                    print("she/she lives in the apartment number: \(theApartmentNumber)")
                }
            }
        }
        // you can see before with the mess with the if let code, there is a better way !
        let anotherPerson = Person(age: 38, residence: Residence(address: Address(buildingNumber: "C-12", streetName: "San Pablo", apartmentNumber: nil)))
        if let theApartmentNumber = anotherPerson.residence?.address?.apartmentNumber {
            print("she/she lives in the apartment number: \(theApartmentNumber)")
        } else { print("there is no existence of apartment number")}
        
    }


}

