//
//  ViewController.swift
//  Sets
//
//  Created by Carlos Santiago Cruz on 12/23/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // A set stores distinct values of the same type in a collection with no defined ordering.
    var letters = Set<Character>()
    var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]

    override func viewDidLoad() {
        super.viewDidLoad()
        //
        letters.insert("a")
        print(letters)
        letters = []
        print(letters)
        //
        print(favoriteGenres)
        // Accessing and Modifying a Set
        print("I have \(favoriteGenres.count) favorite music genres.")
        if favoriteGenres.isEmpty {
            print("As far as music goes, I'm not picky.")
        } else {
            print("I have particular music preferences.")
            print(favoriteGenres)
        }
        favoriteGenres.insert("Jazz")
        print(favoriteGenres)
        if let removedGenre = favoriteGenres.remove("Rock") {
            print("\(removedGenre)? I'm over it.")
            print(favoriteGenres)
        } else {
            print("I never much cared for that.")
            print(favoriteGenres)
        }
        //
        if favoriteGenres.contains("Funk") {
            print("I get up on the good foot.")
            print(favoriteGenres)
        } else {
            print("It's too funky in here.")
            print(favoriteGenres)
        }
        // Iterating Over a Set
        for genre in favoriteGenres {
            print("\(genre)")
        }
        // Swift’s Set type does not have a defined ordering. To iterate over the values of a set in a specific order, use the sorted() method,
        for genre in favoriteGenres.sorted() {
            print("\(genre)")
        }
        // Performing Set Operations
        let oddDigits: Set = [1, 3, 5, 7, 9]
        let evenDigits: Set = [0, 2, 4, 6, 8]
        let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]
        let unionSet = oddDigits.union(evenDigits).sorted()
        print(unionSet)
        let intersectionSet = oddDigits.intersection(evenDigits).sorted()
        print(intersectionSet)
        let substractingSet = oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
        print(substractingSet)
        let symmetricDifferenceSet = oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
        print(symmetricDifferenceSet)
        // Set Membership and Equality
        let houseAnimals: Set = ["🐶", "🐱"]
        let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
        let cityAnimals: Set = ["🐦", "🐭"]
        if houseAnimals.isSubset(of: farmAnimals) {
            print("true")
        }
        if farmAnimals.isSuperset(of: houseAnimals) {
            print("true")
        }
        if farmAnimals.isDisjoint(with: cityAnimals) {
            print("true")
        }
    }


}

