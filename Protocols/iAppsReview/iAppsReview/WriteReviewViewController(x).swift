//
//  WriteReviewTableViewController.swift
//  iAppsReview
//
//  Created by Kevin McNeish on 10/3/14.
//  Copyright (c) 2014 Oak Leaf Enterprises, Inc. All rights reserved.
//

import UIKit

class WriteReviewViewController: UITableViewController,
    AppCategoryDelegate {

    @IBOutlet weak var appCategoryCell: UITableViewCell!
    
    var appCategoryID: NSNumber?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the destination controller
        var controller = segue.destinationViewController as AppCategoryViewController
        
        // Store the appCategoryID on the destination view controller
        controller.appCategoryID = self.appCategoryID
        
        // Store a reference to this view controller in the 
        // delegate property of the destination view controller
        controller.delegate = self
    }
    
    func updateAppCategory(appCategoryEntity: AppCategoryEntity) {
        
        self.appCategoryID = appCategoryEntity.categoryID
        self.appCategoryCell.detailTextLabel?.text = appCategoryEntity.name
        self.tableView.reloadData()
    }

}
