//
//  BookSuggestionsCardViewController.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 28/04/2022.
//

import UIKit

final class BookSuggestionsCardViewController: UIViewController {
    private let cellIdentifier = "SuggestionsViewCell"
    private let bookSuggestionsCardViewModel: BookSuggestionsCardViewProtocol
    private let bookSuggestionsCardView = BookSuggestionsCardView()

    init(bookSuggestionsCardViewModel: BookSuggestionsCardViewModel) {
        self.bookSuggestionsCardViewModel = bookSuggestionsCardViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = bookSuggestionsCardView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let collection = bookSuggestionsCardView.suggestionsCollection else { return }
        collection.register(
            UINib(nibName: cellIdentifier, bundle: nil),
            forCellWithReuseIdentifier: cellIdentifier)
        collection.backgroundColor = .backgroundGray
        collection.delegate = self
        collection.dataSource = self
        loadSuggestions()
    }
    
    private func loadSuggestions() {
        bookSuggestionsCardViewModel.getSuggestions { [weak self] in
            self?.bookSuggestionsCardView.suggestionsCollection.reloadData()
        }
    }
}

extension BookSuggestionsCardViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bookSuggestionsCardViewModel.suggestions.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
                as? SuggestionsViewCell else { return UICollectionViewCell() }
        let book = bookSuggestionsCardViewModel.suggestions[indexPath.row]
        cell.setImages(url: book.link)
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}
