//
//  BookCommentsCardViewModel.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 31/03/2022.
//

import Foundation

protocol BookCommentsCardViewModelProtocol {
    func getComments(action: @escaping () -> Void)
    var comments: [Comment] { get set }
    var user: User? { get set }
    var book: Book { get set }
    func getCellViewModel(index: Int) -> BookCommentsCellModel
}

class BookCommentsCardViewModel: BookCommentsCardViewModelProtocol {
    var book: Book
    var comments: [Comment] = []
    private var commentRepository = CommentRepository()
    private var userRepository = UserRepository()
    var user: User?

    init(book: Book) {
        self.book = book
    }
    
    func getComments(action: @escaping () -> Void) {
        let onSuccess = { (comments: [Comment]) in
            self.comments = comments
            action()
        }
        let onError = { error in print(error) }
        commentRepository.fetchComments(onSuccess: onSuccess, onError: onError, bookID: book.id)
    }
    
    func getCellViewModel(index: Int) -> BookCommentsCellModel {
        BookCommentsCellModel(comment: comments[index])
    }
}
