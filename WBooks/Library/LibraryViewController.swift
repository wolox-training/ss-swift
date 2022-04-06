//
//  LibraryViewController.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 02/03/2022.
//

import UIKit
import WolmoCore

class LibraryViewController: UIViewController {
    private let cellIdentifier = "LibraryViewCell"
    private let viewModel = LibraryViewModel()
    private let libraryView = LibraryView()
    override func loadView() {
        view = libraryView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let table = libraryView.tableView else { return }
        table.register(
            UINib(nibName: cellIdentifier, bundle: nil),
            forCellReuseIdentifier: cellIdentifier)
        table.backgroundColor = .backgroundGray
        table.delegate = self
        table.dataSource = self
        setUpNavBar()
        loadBooks()
    }
    
    private func loadBooks() {
        viewModel.getBooks { [weak self] in
            self?.libraryView.tableView.reloadData()
        }
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
        navbarAppearance.backgroundColor = .backgroundNavBar

        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.standardAppearance = navbarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navbarAppearance
    }
}

extension LibraryViewController: UITableViewDelegate, UITableViewDataSource {
    // MARK: - Table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.books.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
                as? LibraryViewCell else { return UITableViewCell() }
        cell.separatorInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
        let book = viewModel.books[indexPath.row]
        cell.bookTitle.text = book.title
        cell.bookAuthor.text = book.author
        cell.bookCover.image = .cover
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let book = viewModel.books[indexPath.row]
        let bookDetailsViewModel = BookDetailsViewModel(book: book)
        let bookDetailsViewController = BookDetailsViewController(bookDetailsViewModel: bookDetailsViewModel)
        navigationController?.pushViewController(bookDetailsViewController, animated: true)
    }
}
