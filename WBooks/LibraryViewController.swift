//
//  LibraryViewController.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 02/03/2022.
//

import UIKit

class LibraryViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "LibraryViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "LibraryViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // #warning Incomplete implementation, return the number of rows
        let cell = tableView.dequeueReusableCell(withIdentifier: "LibraryViewCell", for: indexPath) as! LibraryViewCell
        return cell
    }
    

}
