//
//  WriteReviewTableViewController.swift
//  iAppsReview
//
//  Copyright (c) 2017 Oak Leaf Enterprises, Inc. All rights reserved.
//
// WriteReviewViewController adopts AppCategoryDelegate Protocol
import UIKit

class WriteReviewViewController: UITableViewController, AppCategoryDelegate { // adopts AppCategoryDelegate Protocol

    @IBOutlet weak var appCategoryCell: UITableViewCell!    // UITableViewCell object labeled appCategoryCell
    var appCategoryID: NSNumber?                            // creates a variable named appCategoryID, NSNumber Type.
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the destination controller, in this case is AppCategoryViewController
        let controller = segue.destination as! AppCategoryViewController    // force casting
        // Store the appCategoryID on the destination view controller
        controller.appCategoryID = self.appCategoryID
        // it asign WriteReviewViewController.appCatergoryID to
        // Store a reference to this view controller in the delegate property of the destination view controller
        // in this last line, the originating view controller stores a reference to itself in the delegate property
        // of the AppCategoryViewController
        // Delegates send messages to you.
        // For example: if you use the accelerometer delegate, you will get messages about the accelerometer.
        // If you use PopUps, PopUps send you messages. And the way that is done, is with the PopUp's delegate. There are many,
        // many examples.
        // When you "set the delegate" what you are doing is saying where you want the messages to go
        // So, delegates send messages.
        // Delegate is used to pass/communicate data/message b/w two objects of classes.
        // Here, tableView(Sender) sends data/message to viewController(Receiver).
        controller.delegate = self  // AppCategoryViewController.delegate to self
    }
    func updateAppCategory(_ appCategoryEntity: AppCategoryEntity) {
        self.appCategoryID = appCategoryEntity.categoryID                   //
        self.appCategoryCell.detailTextLabel?.text = appCategoryEntity.name // it asign appCateryEntity.name to cell
        self.tableView.reloadData() // reload the data of tableView
    }
}
