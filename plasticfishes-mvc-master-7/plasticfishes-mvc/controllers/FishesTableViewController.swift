//
//  FishesTableViewController.swift
//  plasticfishes-mvc
//
//  Created by Luis Ezcurdia on 9/21/18.
//  Copyright © 2018 Luis Ezcurdia. All rights reserved.
//

import UIKit
import Kingfisher

class FishesTableViewController: UITableViewController {
    var fishes: [Fish]? {
        didSet {
            self.tableView.reloadData()
        }
    }
    let cellId = "fishCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Fishes"
        tableView.register(UINib(nibName: "FishesTableViewCell", bundle: nil), forCellReuseIdentifier: cellId)
        loadFishes()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem

    }

    // MARK: - Table view height
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(74)
    }

    // MARK: - Table view data source
    func loadFishes() {
        FishService.shared.all { [weak self] fishes in
            DispatchQueue.main.async {
              self?.fishes = fishes
            }
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fishes?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! FishesTableViewCell
//        // The simplest use-case is setting an image to an image view with the UIImageView extension:
//        let url = URL(string: "url_of_your_image")
//        imageView.kf.setImage(with: url)
//        Kingfisher will download the image from url, send it to both the memory cache and the disk cache, and display it in imageView. When you use the same code later, the image will be retrieved from cache and shown immediately.
        guard let fish = fishes?[indexPath.row] else { return cell }
        cell.titleFish.text = fish.name
        cell.descriptioFish.text = fish.webUrlString
        cell.imageFish.kf.setImage(with: fish.imageURL!)
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard.init(name: "Detail", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "fishDetail")

        navigationController?.pushViewController(viewController, animated: true)

    }
    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
