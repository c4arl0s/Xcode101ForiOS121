//
//  ItemStore.swift
//  ProgramaticallyTableViewHomepwner
//
//  Created by Carlos Santiago Cruz on 19/10/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit

// ItemStore is a Swift base class – it does not inherit from any other class.
// Unlike the Item class that you defined earlier, ItemStore does not require any of the behavior that NSObject affords.

class ItemStore {
    var allItems = [Item]()
    
    @discardableResult func createItem() -> Item {
        let newItem = Item(random: true)
        allItems.append(newItem)
        return newItem
    }
    init() {
        for _ in 0..<7 {
            createItem()
        }
    }
}

//// @discardableResult annotation means that a caller of this function is free to ignore the result of calling this function.
//// this is OK
//let newItem = ItemStore.createItem()
//// This is also OK; the result is not assigned to a variable:
//itemStore.createItem()
//let _ = createItem()

