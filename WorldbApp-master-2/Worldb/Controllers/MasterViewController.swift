//
//  MasterViewController.swift
//  Worldb
//
//  Created by Luis Ezcurdia on 9/29/18.
//  Copyright © 2018 Luis Ezcurdia. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {
    var objects = [Country]()
    var filteredObjects = [Country]()
    let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        setupSearchController()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTheme()
    }
    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        if segue.identifier == "showCountry" {
            let object = fetchObjectAt(row: indexPath.row)
            let controller = segue.destination as! CountryViewController
            controller.country = object
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filteredObjects.count
        }
        return objects.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let object = fetchObjectAt(row: indexPath.row)
        cell.textLabel?.text = object.name
        cell.detailTextLabel?.text = object.iso
        
        object.flagImage { [weak cell] (img) in
            cell?.imageView?.image = img
        }
        return cell
    }

    func setTheme()  {
        if UserDefaults.standard.bool(forKey: "nightTheme"){
            self.navigationController?.navigationBar.barTintColor = UIColor.darkBlue
            self.navigationController?.navigationBar.tintColor = UIColor.aqua
            self.tableView.backgroundColor = UIColor.darkBlue
            self.tableView.tintColor = UIColor.morningLight
            self.tableView.separatorColor = UIColor.aqua
        } else {
            self.navigationController?.navigationBar.barTintColor = UIColor.aqua
            self.navigationController?.navigationBar.tintColor = UIColor.darkBlue
            self.tableView.backgroundColor = UIColor.morningLight
            self.tableView.tintColor = UIColor.darkBlue
            self.tableView.separatorColor = UIColor.grayBlue
        }
    }
    
    func loadData() {
        CountryService.shared.all { [weak self] countries in
            self?.objects = countries
            self?.tableView.reloadData()
        }
    }
    
    func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.backgroundColor = .clear
        
        searchController.searchBar.placeholder = "Search Country"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    func fetchObjectAt(row: Int) -> Country {
        if isFiltering() {
            return filteredObjects[row]
        } else {
            return objects[row]
        }
    }

    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
}

extension MasterViewController: UISearchResultsUpdating {
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredObjects = objects.filter({ country -> Bool in
            return country.name.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
    
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }

}
