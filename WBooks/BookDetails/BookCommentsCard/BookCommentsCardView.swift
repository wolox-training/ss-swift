//
//  BookCommentsCardView.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 31/03/2022.
//

import Foundation
import WolmoCore

class BookCommentsCardView: NibView {
    @IBOutlet weak var commentsTableView: UITableView! {
        didSet {
            commentsTableView.backgroundColor = .white
            commentsTableView.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var viewTable: UIView! {
        didSet {
            viewTable.addShadow(radius: 1)
        }
    }
}
