//
//  ViewController.swift
//  Optionals
//
//  Created by Carlos Santiago Cruz on 12/9/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var firstHarryPotter = Book(name: "Harry Potter 1", publicationYear: 1999)
        var secondHarryPotter = Book(name: "Harry Potter 2", publicationYear: 2000)
        var thirdHarryPotter = Book(name: "Harry Potter 3", publicationYear: 2001)
        let booksOfHarryPotter = [firstHarryPotter, secondHarryPotter, thirdHarryPotter]
        // unnanouncedMovie, we dont know what year is going to be release,
        // so we could asign nil, because is optional
        var unnanouncedBook = Book(name: "Harry Potter 20", publicationYear: nil)
        
        firstHarryPotter.name = "Harry Potter y la camara secreta"
        secondHarryPotter.publicationYear = 2001
        thirdHarryPotter.name = "Harry Potter y el prisionero de Askaban"
        print(booksOfHarryPotter.count)
        
        // I can change the year of unnanouncedBook to 2025
        unnanouncedBook.publicationYear = 2025
        
        // I can create an empty array of books
        var arrayOfBooks: [Book] = [firstHarryPotter, secondHarryPotter]
        var counter: Int
        counter = arrayOfBooks.count
        print(counter)
        arrayOfBooks = [firstHarryPotter, secondHarryPotter, thirdHarryPotter]
        print(arrayOfBooks)
        
        // working with optional values
        
        unnanouncedBook.publicationYear = 2345
        
        if let unwrappedPublicationYear = unnanouncedBook.publicationYear {
            print("the book was publisshed in \(unwrappedPublicationYear)")
        } else {
            print("the book does not have a publication year")
        }
        
        if unnanouncedBook.publicationYear != nil {
            print("the book was publisshed in \(String(describing: unnanouncedBook.publicationYear))")
        }
        else {
            print("the book does not have a publication year in this part of the code")
        }
        guard let unwrappedPublicationYear = unnanouncedBook.publicationYear else {return}
        print(unwrappedPublicationYear)
        
        guard unnanouncedBook.publicationYear == nil else {return}
        print(String(describing: unnanouncedBook.publicationYear))
    }
    

}

