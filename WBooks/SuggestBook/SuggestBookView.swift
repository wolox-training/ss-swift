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
    
    @IBOutlet weak var bookName: InputFields! {
        didSet {
            bookName.placeholder = "BOOK_NAME".localized()
        }
    }
    
    @IBOutlet weak var bookAuthor: InputFields! {
        didSet {
            bookAuthor.placeholder = "AUTHOR".localized()
        }
    }
    
    @IBOutlet weak var bookYear: InputFields! {
        didSet {
            bookYear.placeholder = "YEAR".localized()
        }
    }
    
    @IBOutlet weak var bookTopic: InputFields! {
        didSet {
            bookTopic.placeholder = "TOPIC".localized()
        }
    }
    
    @IBOutlet weak var bookDescription: InputFields! {
        didSet {
            bookDescription.placeholder = "DESCRIPTION".localized()
        }
    }
    
    @IBAction func addNewButtonPress(_ sender: Any) {
        print("ouch")
    }
}
