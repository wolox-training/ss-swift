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
    private let viewModel = LibraryViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        tableView.backgroundColor = UIColor(hex: "#EAF6FA")
        setUpNavBar()
    }

    private func setUpNavBar() {
        let title = UILabel()
        title.font = UIFont.boldSystemFont(ofSize: 17)
        title.textColor = .white
        title.text = "LIBRARY_VIEW_TITLE".localized()
        title.backgroundColor = .clear
        navigationItem.titleView = title
        let notifications = UIBarButtonItem(image: UIImage(named: "ic_notifications"),
                                            style: .plain, target: self, action: nil)
        let search = UIBarButtonItem(image: UIImage(named: "ic_search"), style: .plain, target: self, action: nil)
        setNavigationLeftButtons([notifications])
        setNavigationRightButtons([search])

        let navbarAppearance = UINavigationBarAppearance()
        navbarAppearance.backgroundColor = UIColor(hex: "#00ADEE")

        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.standardAppearance = navbarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navbarAppearance
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
                as? LibraryViewCell else { return UITableViewCell() }
        cell.separatorInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
        let book = viewModel.getBooksByIndex(index: indexPath.row)
        cell.bookTitle.text = book.title
        cell.bookAuthor.text = book.author
        cell.bookCover.image = UIImage(named: "img_book\(String(indexPath.row+1)).png")
        return cell
    }
}
