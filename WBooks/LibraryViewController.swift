//
//  LibraryViewController.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 02/03/2022.
//

import UIKit
import WolmoCore

class LibraryViewController: UITableViewController {
    private let cellIdentifier = "LibraryViewCell"
    
    var titles = ["A Little Bird Told Me",
                  "When the Doves Disappeared",
                  "The Best Book in the World",
                  "Be Creative",
                  "This is also UX",
                  "A Little Bird Told Me",
                  "When the Doves Disappeared",
                  "The Best Book in the World",
                  "Be Creative",
                  "This is also UX"]
    
    var authors = ["Timothy Cross",
                   "Sofi Oksanen",
                   "Peter Sjernstrom",
                   "Tony Alcazar",
                   "Liliana Castilla",
                   "Timothy Cross",
                   "Sofi Oksanen",
                   "Peter Sjernstrom",
                   "Tony Alcazar",
                   "Liliana Castilla"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        tableView.backgroundColor = UIColor(hex: "#EAF6FA")
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! LibraryViewCell
        cell.separatorInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
        cell.bookTitle.text = titles[indexPath.row]
        cell.bookAuthor.text = authors[indexPath.row]
        cell.bookCover.image = UIImage(named: "img_book\(String(indexPath.row+1)).png")
        return cell
    }
}
