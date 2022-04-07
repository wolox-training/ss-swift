//
//  BookDetailsCardViewController.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 31/03/2022.
//

import UIKit

final class BookDetailsCardViewController: UIViewController {
        private lazy var bookDetailsCardView = BookDetailsCardView()
        private let bookDetailsCardViewModel: BookDetailsCardViewModelProtocol
        let available = "Available"
        let unavailable = "Unavailable".localized()
        
        init(bookDetailsCardViewModel: BookDetailsCardViewModel) {
            self.bookDetailsCardViewModel = bookDetailsCardViewModel
            super.init(nibName: nil, bundle: nil)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            tabBarController?.tabBar.isHidden = true
            bookDetailsCardView.onRentButton = rentBook
            setBookDetails()
        }
        
        override func loadView() {
            view = bookDetailsCardView
        }
        
        private func setBookDetails() {
            let book = bookDetailsCardViewModel.book
            bookDetailsCardView.titleLabel.text = book.title
            bookDetailsCardView.statusLabel.text = book.status.localized()
            bookDetailsCardView.authorLabel.text = book.author
            bookDetailsCardView.yearLabel.text = book.year
            bookDetailsCardView.genreLabel.text = book.genre
            bookDetailsCardView.bookCoverImage.image = .cover
           
            if book.status == available {
                bookDetailsCardView.statusLabel.textColor = .available
            } else {
                bookDetailsCardView.statusLabel.textColor = .unavailable
            }
        }
        
        private func rentBook() {
            if bookDetailsCardView.statusLabel.text == unavailable {
                showAlertBookUnavailble(title: "ALERT_TITLE".localized(), message: "ALERT_MESSAGE".localized())
            } else {
                loadRent()
            }
        }
        
        private func loadRent() {
            bookDetailsCardViewModel.rentBook { [weak self] in
                self?.bookDetailsCardView.statusLabel.text = "Unavailable".localized()
                self?.bookDetailsCardView.statusLabel.textColor = .unavailable
            }
        }

        func showAlertBookUnavailble(title: String, message: String) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK".localized(), style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
}
