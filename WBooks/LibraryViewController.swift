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
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 5
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // #warning Incomplete implementation, return the number of rows
        let cell = tableView.dequeueReusableCell(withIdentifier: "LibraryViewCell", for: <#T##IndexPath#>) as! LibraryViewCell
        
        return cell
    }
    

}
