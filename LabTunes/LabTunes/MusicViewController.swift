//
//  MusicViewController.swift
//  LabTunes
//
//  Created by Carlos Santiago Cruz on 10/11/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import UIKit

class MusicViewController: UIViewController {
    var songs: [Song] = []
    let searchController = UISearchController(searchResultsController: nil)
    
    @IBOutlet weak var musicTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func downloadSongs () {
        Music.fetchSongs { (result: [Song]) in
            self.songs = result
            DispatchQueue.main.async {
                self.musicTableView.reloadData()
            }
        }
    }
    func setupSearchBar() {
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "searchSong"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func downloadSongsByName (name: String) {
        Music.fetchSongs(songName: name) { (result: [Song]) in
            self.songs = result
            DispatchQueue.main.async {
                self.musicTableView.reloadData()
            }
        }
    }
}

extension MusicViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath)
        cell.textLabel?.text = songs[indexPath.row].name
        return cell
    }
}
extension MusicViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
            downloadSongsByName(name: searchController.searchBar.text!)
        }
    }

