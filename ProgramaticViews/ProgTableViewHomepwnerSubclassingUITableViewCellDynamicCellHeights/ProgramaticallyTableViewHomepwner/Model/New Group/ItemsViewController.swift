//
//  ItemsViewController.swift
//  ProgramaticallyTableViewHomepwner
//
//  Created by Carlos Santiago Cruz on 19/10/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import Foundation

import UIKit
class ItemsViewController: UITableViewController {
    // In ItemsViewController.swift, add a property for an ItemStore.
    var itemStore: ItemStore!
    //  Access the ItemsViewController (which will be the rootViewController of the window) and set its itemStore property to be a new instance of ItemStore.
    override func viewDidLoad() {
        super.viewDidLoad()
        // set the xib to the controller
        tableView.register(UINib(nibName: "ItemCell", bundle: nil), forCellReuseIdentifier: "ItemCell")
        // Get the height of the status bar
        // A UITableView is a subclass of UIScrollView
        // You can think of the content inset as padding for all four sides of the scroll view.
        addSomePaddingToTheTop()
        // Using ItemCell
        // Now that you are using a custom UITableViewCell subclass, the table view needs to know how tall each row is.
        // tableView.rowHeight = 65
        //  You need to add a constraint between the two left labels that fixes the vertical spacing between them to do the next code.  
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 65
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemStore.allItems.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Get a new or recycled cell
        // let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCellIdentifier", for: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        // Set the text on the cell with the description of the item
        // that is at the nth index of items, where n = row this cell
        // will appear in on the tableview
        let item = itemStore.allItems[indexPath.row]
        // Configure the cell with the Item
        cell.nameLabel.text = item.name
        cell.serialNumberLabel.text = item.serialNumber
        cell.valueLabel.text = "$\(item.valueInDollars)"
        return cell
    }
    func addSomePaddingToTheTop() {
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
    }
    
}
