//
//  BookRentalsCardViewController.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 26/04/2022.
//

import UIKit
import WolmoCore

final class BookRentalsCardViewController: UIViewController {
    private let cellIdentifier = "LibraryViewCell"
    private let bookRentalsCardViewModel: BookRentalsCardViewProtocol
    private let bookRentalsCardView = BookRentalsCardView()

    init(bookRentalsCardViewModel: BookRentalsCardViewModel) {
        self.bookRentalsCardViewModel = bookRentalsCardViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = bookRentalsCardView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpRentalsTable()
        loadRents()
    }

    private func setUpRentalsTable() {
        guard let table = bookRentalsCardView.rentalsTableView else { return }
        table.register(
            UINib(nibName: cellIdentifier, bundle: nil),
            forCellReuseIdentifier: cellIdentifier)
        table.backgroundColor = .backgroundGray
        table.delegate = self
        table.dataSource = self
    }
    
    private func loadRents() {
        let loadingView = UIView()
        let spinner = UIActivityIndicatorView(style: .large)
        showSpinner(view: bookRentalsCardView, loadingView: loadingView, spinner: spinner)
        bookRentalsCardViewModel.getRents { [weak self] in
            self?.bookRentalsCardView.rentalsTableView.reloadData()
            self?.removeSpinner(loadingView: loadingView, spinner: spinner)
        }
    }
}

extension BookRentalsCardViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookRentalsCardViewModel.books.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
                as? LibraryViewCell else { return UITableViewCell() }
        cell.separatorInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
        let book = bookRentalsCardViewModel.books[indexPath.row]
        cell.setUpCell(book: book)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var book = bookRentalsCardViewModel.books[indexPath.row]
        book.status = "IN_YOUR_HANDS".localized()
        let bookDetailsViewModel = BookDetailsViewModel(book: book)
        let bookDetailsViewController = BookDetailsViewController(bookDetailsViewModel: bookDetailsViewModel)
        bookDetailsViewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(bookDetailsViewController, animated: true)
    }
}
