//
//  AppCategoryViewController.swift
//  iAppsReview
//
//  Copyright (c) 2017 Oak Leaf Enterprises, Inc. All rights reserved.
//

import UIKit
import CoreData

// you can declare a protocol in its own class file, or in the same file as a related class.
protocol AppCategoryDelegate { func updateAppCategory(_ appCategoryEntity: AppCategoryEntity) }

class AppCategoryViewController: UITableViewController {

    var appCategoryID: NSNumber?
    var delegate: AppCategoryDelegate?                  // an original view controller that implements the AppCategoryDelegate
                                                        // protocol can store a reference to itself in this property.
    var appCategoryList = Array<AppCategoryEntity>()    //
    var appCategory = AppCategory()                     // creates an instance variable of AppCategory type
    var oldIndexPath: IndexPath?                        // creates an optional instance variable of struct IndexPath
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.appCategoryList = appCategory.getAllEntities() // it applies a type method to appCategory class, then asign to
                                                            // appCategoryList
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return self.appCategoryList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        // Configure the cell...
        let categoryEntity: AppCategoryEntity = self.appCategoryList[(indexPath as NSIndexPath).row] as AppCategoryEntity
        cell.textLabel!.text = categoryEntity.name
        // Check/uncheck the current cell
        if categoryEntity.categoryID.intValue == self.appCategoryID?.intValue
        {
            cell.accessoryType = UITableViewCellAccessoryType.checkmark
            oldIndexPath = indexPath
        }
        else
        {
            cell.accessoryType = UITableViewCellAccessoryType.none
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Deselect the currently selected row
        self.tableView.deselectRow(at: self.tableView.indexPathForSelectedRow!, animated: true)
        // Uncheck the previously selected cell, check the currently selected cell
        if  let i = oldIndexPath {
            tableView.cellForRow(at: i)?.accessoryType = UITableViewCellAccessoryType.none
        }
        tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.checkmark
        // Save the current indexPath for later
        oldIndexPath = indexPath
        // Send a callback message to the delegate (presenting view controller)
        let categoryEntity: AppCategoryEntity = self.appCategoryList[(indexPath as NSIndexPath).row] as AppCategoryEntity
        self.delegate?.updateAppCategory(categoryEntity)
    }

}
