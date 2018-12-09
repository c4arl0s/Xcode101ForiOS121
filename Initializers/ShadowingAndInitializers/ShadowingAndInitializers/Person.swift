//
//  Person.swift
//  ShadowingAndInitializers
//
//  Created by Carlos Santiago Cruz on 12/9/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import Foundation

struct Person {
    var name: String
    var age: Int
    
    // you can take advantage of your knowledge of variable shadowing to create clean, easy-to-read initializers.
    // Suppose you want to create an instance of a Person by passing in a name and age as its two parameters. You will also assume that every Person instance has both name and age properties.
    // As you are writing the initializer, you will want to keep it as simple and logical as possible: assigning the bane parameter to the name property ans assigning the age parameter to the age property.
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    // since name and age are the names of parameters within the function scope, they shadow the name and age properties defined within the Person scope.
    // you can place the keyword self in front of the property name to reference the property specifically- and to avoid any confusion that the variable shadowing may cause to the compiler and the reader. This syntax majes it very clear that the name and age properties are set to the name and age parameters passed into the initializer.
}
