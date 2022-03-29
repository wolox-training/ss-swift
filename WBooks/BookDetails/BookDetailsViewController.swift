//
//  BookDetailsViewController.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 25/03/2022.
//

import UIKit
import WolmoCore

class BookDetailsViewController: UIViewController {
    
    private lazy var bookDetailsView = BookDetailsView()
    private let bookDetailsViewModel: BookDetailsViewModel
    
    init(bookDetailsViewModel: BookDetailsViewModel) {
        self.bookDetailsViewModel = bookDetailsViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.isHidden = true
        setBookDetails()
        setUpNavBar()
        bookDetailsView.onRentButton = rentBook
    }
    
    override func loadView() {
        view = bookDetailsView
    }
    
    private func setUpNavBar() {
        let title = UILabel()
        title.font = UIFont.boldSystemFont(ofSize: 17)
        title.textColor = .white
        title.text = "BOOK_DETAILS_TITLE".localized()
        title.backgroundColor = .clear
        navigationItem.titleView = title

        let navbarAppearance = UINavigationBarAppearance()
        navbarAppearance.backgroundColor = UIColor(hex: "#00ADEE")

        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.standardAppearance = navbarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navbarAppearance
    }
    
    private func setBookDetails() {
        let book = bookDetailsViewModel.book
        bookDetailsView.titleLabel.text = book.title
        bookDetailsView.statusLabel.text = book.status.localized()
        bookDetailsView.authorLabel.text = book.author
        bookDetailsView.yearLabel.text = book.year
        bookDetailsView.genreLabel.text = book.genre
        bookDetailsView.bookCoverImage.image = UIImage(named: "img_book5")
       
        if book.status == "Available" {
            bookDetailsView.statusLabel.textColor = UIColor(hex: "#A5CD39")
        } else {
            bookDetailsView.statusLabel.textColor = UIColor(hex: "#D0021B")
        }
    }
    
    private func rentBook() {
        if bookDetailsView.statusLabel.text == "Unavailable".localized() {
            showAlertBookUnavailble(title: "ALERT_TITLE".localized(), message: "ALERT_MESSAGE".localized())
        } else {
            loadRent()
        }
    }
    
    private func loadRent() {
        bookDetailsViewModel.rentBook { [weak self] in
            self?.bookDetailsView.statusLabel.text = "Unavailable".localized()
            self?.bookDetailsView.statusLabel.textColor = UIColor(hex: "#D0021B")
        }
    }
    
    func showAlertBookUnavailble(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
