//
//  HowToOrderPressureRegulatorValveTableViewController.swift
//  HowToOrderPRVMK60
//
//  Created by Carlos Santiago Cruz on 04/10/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit

class HowToOrderPressureRegulatorValveTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Easy Order MK60 Valve"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return howToOrderValves.count
        } else {
            return 0
        }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellSelection" , for: indexPath)
        let valve = howToOrderValves[indexPath.row]
        cell.showsReorderControl = true
        cell.textLabel?.text = "\(valve.model.feature)"
        cell.detailTextLabel?.text = valve.model.feature
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //tableView.deselectRow(at: indexPath, animated: true)
        let const = indexPath.row
        print(const)
        let valve = howToOrderValves[indexPath.row]
        print("\(valve.model) \(valve.model.feature)")
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
        }
    }
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none
        }
    }
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedValve = howToOrderValves.remove(at: sourceIndexPath.row)
        howToOrderValves.insert(movedValve, at: destinationIndexPath.row)
        tableView.reloadData()
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            howToOrderValves.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .top)
        }
    }
    @IBAction func nextButtonTapped(_ sender: UIBarButtonItem) {
        print("you pressed next button, the last row is ")
    }
    

}
