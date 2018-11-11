//
//  ContactsTableViewController.swift
//  ContactsApp
//
//  Created by Carlos Santiago Cruz on 06/09/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit

class ContactsTableViewController: UITableViewController {
    let contacts : [[String]] = [
        ["Elon Musk",       "+1-201-3141-5926"],
        ["Bill Gates",      "+1-202-5358-9793"],
        ["Tim Cook",        "+1-203-2384-6264"],
        ["Richard Branson", "+1-204-3383-2795"],
        ["Jeff Bezos",      "+1-205-0288-4197"],
        ["Warren Buffet",   "+1-206-1693-9937"],
        ["The Zuck",        "+1-207-5105-8209"],
        ["Carlos Slim",     "+1-208-7494-4592"],
        ["Bill Gates",      "+1-209-3078-1640"],
        ["Larry Page",      "+1-210-6286-2089"],
        ["Harold Finch",    "+1-211-9862-8034"],
        ["Sergey Brin",     "+1-212-8253-4211"],
        ["Jack Ma",         "+1-213-7067-9821"],
        ["Steve Ballmer",   "+1-214-4808-6513"],
        ["Phil Knight",     "+1-215-2823-0664"],
        ["Paul Allen",      "+1-216-7093-8446"],
        ["Woz",             "+1-217-0955-0582"]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //  In our case, we’re using the function to register the table view cell.
        // When you register a table view cell, you also have to provide an identifier.
        // This is simply to associate the class of the cell with a name you can use later, when dequeuing the cell in tableView(_:cellForRowAt:) .
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellIdentifier")
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // A table view can have multiple sections or groups.
        //Every group has a header that floats on top of the vertical row of cells.
        // In a Contacts app, you could group contacts together alphabetically.
        // This is actually done in the Contacts app on iPhone, where contacts are grouped A-Z.
        // return just 1 section.
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // The app we’re building has just one section,
        // and that one section has a number of items equal to the number of items in the contacts array.
        // So, that’s contacts.count !
        
        return contacts.count
    }

}
