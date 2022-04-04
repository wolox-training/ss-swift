//
//  BookDetailsView.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 23/03/2022.
//

import UIKit
import WolmoCore

class BookDetailsView: NibView {
    @IBOutlet weak var bookCoverImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var bookDetailsCard: UIView! {
        didSet {
            bookDetailsCard.backgroundColor = .white
            bookDetailsCard.layer.cornerRadius = 5
        }
    }
    @IBOutlet var view: UIView! {
        didSet {
            view.backgroundColor = .backgroundGray
        }
    }
    @IBOutlet weak var wishlistButton: UIButton! {
        didSet {
            wishlistButton.setTitle("REMOVE_WISHLIST".localized(), for: .normal)
        }
    }
    @IBOutlet weak var rentButton: UIButton! {
        didSet {
            rentButton.setTitle("RENT".localized(), for: .normal)
        }
    }
    var onRentButton: (() -> Void)?
    
    @IBAction func rentButton(_ sender: UIButton) {
        onRentButton?()
    }
}
