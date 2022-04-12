//
//  SuggestBook.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 12/04/2022.
//

import Foundation
import WolmoCore

final class SuggestBookView: NibView {
    
    @IBOutlet var generalView: UIView! {
        didSet {
            generalView.backgroundColor = .backgroundGray
        }
    }
    @IBOutlet weak var newBookView: UIView! {
        didSet {
            newBookView.backgroundColor = .white
            newBookView.addShadow(radius: 1)
        }
    }
    @IBOutlet weak var bookImage: UIImageView! {
        didSet {
            bookImage.image = UIImage(named: "ic_add new active")
            bookImage.contentMode = .center
            bookImage.backgroundColor = .backgroundGray
        }
    }
    @IBOutlet weak var addNewBookButton: UIButton!
    @IBOutlet weak var submitButton: UIButton! {
        didSet {
            submitButton.setTitle("SUBMIT".localized(), for: .normal)
            submitButton.applyGradient()
        }
    }
    @IBAction func addNewButtonPress(_ sender: Any) {
        print("ouch")
    }
}
