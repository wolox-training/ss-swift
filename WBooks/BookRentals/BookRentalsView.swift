//
//  BookRentalsView.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 25/04/2022.
//

import UIKit
import WolmoCore

final class BookRentalsView: NibView {
    @IBOutlet var view: UIView! {
        didSet {
            view.backgroundColor = .backgroundGray
        }
    }
    @IBOutlet weak var collectionTitle: UILabel! {
        didSet {
            collectionTitle.text = "SUGGESTIONS".localized()
        }
    }
    @IBOutlet weak var myRentalsCard: UIView!
    @IBOutlet weak var suggestionsCard: UIView!
}
