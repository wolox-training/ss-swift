//
//  BookDetailsCardView.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 31/03/2022.
//

import Foundation
import WolmoCore

final class BookDetailsCardView: NibView {
    @IBOutlet weak var bookCoverImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var bookDetailsCard: UIView! {
        didSet {
            bookDetailsCard.backgroundColor = .white
            bookDetailsCard.addShadow(radius: 1)
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
            rentButton.applyGradient()
        }
    }
    var onRentButton: (() -> Void)?
    
    @IBAction func rentButton(_ sender: UIButton) {
        onRentButton?()
    }
}
