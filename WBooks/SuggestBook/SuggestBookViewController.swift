//
//  SuggestBookViewController.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 12/04/2022.
//

import UIKit

final class SuggestBookViewController: UIViewController {
    private let suggestBookView = SuggestBookView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavBar()
    }
    
    override func loadView() {
        view = suggestBookView
    }
    
    override func viewDidAppear(_ animated: Bool) {
        suggestBookView.submitButton.applyGradient()
    }
    
    private func setUpNavBar() {
        let title = UILabel()
        title.font = UIFont.boldSystemFont(ofSize: 17)
        title.textColor = .white
        title.text = "SUGGEST_BOOK_TITLE".localized()
        title.backgroundColor = .clear
        navigationItem.titleView = title

        let navbarAppearance = UINavigationBarAppearance()
        navbarAppearance.backgroundColor = .backgroundNavBar

        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.standardAppearance = navbarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navbarAppearance
    }
}
