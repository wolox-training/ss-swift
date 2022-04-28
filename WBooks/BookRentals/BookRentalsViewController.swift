//
//  BookRentalsViewController.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 25/04/2022.
//

import UIKit
import WolmoCore

final class BookRentalsViewController: UIViewController {
    private let bookRentalsView = BookRentalsView()
    private let bookRentalsViewModel: BookRentalsViewProtocol
    private let bookRentalsCardViewController: BookRentalsCardViewController

    init(bookRentalsViewModel: BookRentalsViewModel) {
        self.bookRentalsViewModel = bookRentalsViewModel
        let bookRentalsCardViewModel = bookRentalsViewModel.bookRentalsCardViewModel()
        bookRentalsCardViewController = BookRentalsCardViewController(
            bookRentalsCardViewModel: bookRentalsCardViewModel)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = bookRentalsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavBar()
        addSection(bookRentalsCardViewController, bookRentalsView.myRentalsCard)
    }
    
    private func addSection(_ child: UIViewController, _ viewFrame: UIView) {
        addChild(child)
        viewFrame.addSubview(child.view)
        viewFrame.addSubViewWithConstraints(child: child.view, parent: viewFrame)
        child.didMove(toParent: self)
    }

    private func setUpNavBar() {
        let title = UILabel()
        title.font = UIFont.boldSystemFont(ofSize: 17)
        title.textColor = .white
        title.text = "MY_RENTALS_TITLE".localized()
        title.backgroundColor = .clear
        navigationItem.titleView = title

        let navbarAppearance = UINavigationBarAppearance()
        navbarAppearance.backgroundColor = .backgroundNavBar

        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.standardAppearance = navbarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navbarAppearance
    }
}
