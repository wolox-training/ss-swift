//
//  BookDetailsViewController.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 25/03/2022.
//

import UIKit
import WolmoCore

class BookDetailsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.isHidden = true
        let bookDetailsCardVC = BookDetailsCardViewController().view!
        bookDetailsCardVC.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bookDetailsCardVC)
        NSLayoutConstraint.activate([
            bookDetailsCardVC.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            bookDetailsCardVC.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20),
            bookDetailsCardVC.topAnchor.constraint(equalTo: view.topAnchor, constant: 35),
            bookDetailsCardVC.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 35)
        ])
        let bookCommentsCardVC = BookCommentsCardViewController().view!
        bookCommentsCardVC.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bookCommentsCardVC)
        NSLayoutConstraint.activate([
            bookCommentsCardVC.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            bookCommentsCardVC.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20),
            bookCommentsCardVC.topAnchor.constraint(equalTo: bookDetailsCardVC.topAnchor, constant: 0),
            bookCommentsCardVC.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 34)
        ])
    }
}
