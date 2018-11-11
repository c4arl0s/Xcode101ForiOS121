//
//  OnlineReviewsViewController.swift
//  iAppsReview
//
//  Copyright (c) 2017 Oak Leaf Enterprises, Inc. All rights reserved.
//

import UIKit

class OnlineReviewsViewController: UITableViewController {
    
    @IBOutlet weak var appCategoryCell: UITableViewCell!
    
    var appCategoryID: NSNumber?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier! == "OnlineReviewsToAppCategory"
        {
            let acViewController = segue.destination as! AppCategoryViewController
            acViewController.appCategoryID = self.appCategoryID
        }
    }
}
