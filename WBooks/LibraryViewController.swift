//
//  LibraryViewController.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 02/03/2022.
//

import UIKit

class LibraryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    
    var titles: [String] = []
    var authors: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(LibraryViewCell.self, forCellReuseIdentifier: "LibraryViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .lightGray
        titles = ["A Little Bird Told Me","When the Doves Disappeared","The Best Book in the World","Be Creative","This is also UX"]
        authors = ["Timothy Cross","Sofi Oksanen","Peter Sjernstrom","Tony Alcazar","Liliana Castilla"]
    }

    // MARK: - Table view data source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // #warning Incomplete implementation, return the number of rows
        let cell = tableView.dequeueReusableCell(withIdentifier: "LibraryViewCell", for: indexPath) as! LibraryViewCell
        cell.bookTitle.text = titles[indexPath.row]
        cell.bookAuthor.text = authors[indexPath.row]
        cell.bookCover.image = UIImage(named: "img_book"+(String(indexPath.row+1)))
        return cell
    }
    

}
