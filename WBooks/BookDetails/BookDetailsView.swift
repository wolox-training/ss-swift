//
//  BookDetailsView.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 23/03/2022.
//

import UIKit
import WolmoCore

final class BookDetailsView: NibView {
    @IBOutlet var view: UIView! {
        didSet {
            view.backgroundColor = .backgroundGray
        }
    }
    @IBOutlet weak var detailsCard: UIView!
    @IBOutlet weak var commentsCard: UIView!
}
