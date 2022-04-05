//
//  BookDetailsView.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 23/03/2022.
//

import UIKit
import WolmoCore

class BookDetailsView: NibView {
    @IBOutlet var view: UIView! {
        didSet {
            view.backgroundColor = .backgroundGray
        }
    }
}
