//
//  TableViewController.swift
//  TestingNewTablewVIewController
//
//  Created by Carlos Santiago Cruz on 04/11/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
   
    let array = ["Modelo", "Size", "Material Body"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(array.count)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as? TableViewCell else { fatalError("Could not dequeue a cell") }
        let titleCell = array[indexPath.row]
        print(array[indexPath.row])
        cell.labelCell.text = titleCell
        return cell
    }

}
