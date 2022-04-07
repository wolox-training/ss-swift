//
//  BookDetailsViewController.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 25/03/2022.
//

import UIKit
import WolmoCore

final class BookDetailsViewController: UIViewController {
    private let bookDetailsView = BookDetailsView()
    private let bookDetailsViewModel: BookDetailsViewModelProtocol
    private let bookCommentsCardViewController: BookCommentsCardViewController
    private let bookDetailsCardViewController: BookDetailsCardViewController

    init(bookDetailsViewModel: BookDetailsViewModel) {
        self.bookDetailsViewModel = bookDetailsViewModel
        let commentsViewModel = bookDetailsViewModel.bookCommentsCardViewModel()
        let detailsCardViewModel = bookDetailsViewModel.bookDetailsCardViewModel()
        bookCommentsCardViewController = BookCommentsCardViewController(bookCommentsCardViewModel: commentsViewModel)
        bookDetailsCardViewController = BookDetailsCardViewController(bookDetailsCardViewModel: detailsCardViewModel)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = bookDetailsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.isHidden = true
        setUpNavBar()
        addSection(bookCommentsCardViewController, bookDetailsView.commentsCard)
        addSection(bookDetailsCardViewController, bookDetailsView.detailsCard)
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
        title.text = "BOOK_DETAILS_TITLE".localized()
        title.backgroundColor = .clear
        navigationItem.titleView = title

        let navbarAppearance = UINavigationBarAppearance()
        navbarAppearance.backgroundColor = .backgroundNavBar

        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.standardAppearance = navbarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navbarAppearance
    }
}
