//
//  BookCommentsCardViewController.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 31/03/2022.
//

import UIKit
import WolmoCore

final class BookCommentsCardViewController: UIViewController {
    private let cellIdentifier = "BookCommentsCell"
    private lazy var bookCommentsCardView = BookCommentsCardView()
    private var bookCommentsCardViewModel: BookCommentsCardViewModelProtocol
    
    init(bookCommentsCardViewModel: BookCommentsCardViewModel) {
        self.bookCommentsCardViewModel = bookCommentsCardViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.isHidden = true
        loadComment()
        setUpTableView()
    }
    
    private func setUpTableView() {
        guard let table = bookCommentsCardView.commentsTableView else { return }
        table.register(
            UINib(nibName: cellIdentifier, bundle: nil),
            forCellReuseIdentifier: cellIdentifier)
        table.delegate = self
        table.dataSource = self
    }
    
    override func loadView() {
        view = bookCommentsCardView
    }
    
    private func loadComment() {
        bookCommentsCardViewModel.getComments { [weak self] in
            self?.bookCommentsCardView.commentsTableView.reloadData()
        }
    }
}

extension BookCommentsCardViewController: UITableViewDelegate, UITableViewDataSource {
    // MARK: - Table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookCommentsCardViewModel.comments.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
                as? BookCommentsCell else { return UITableViewCell() }
        let cellViewModel = bookCommentsCardViewModel.getCellViewModel(index: indexPath.row)
        cellViewModel.getUser {
            cell.setUpCell(viewModel: cellViewModel)
        }
        return cell
    }
}
