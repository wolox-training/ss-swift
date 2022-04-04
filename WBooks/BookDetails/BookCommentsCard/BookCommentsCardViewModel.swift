//
//  BookCommentsCardViewModel.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 31/03/2022.
//

import Foundation

class BookCommentsCardViewModel {
    let book: Book
    private(set) var comments: [Comment] = []
    private var commentRepository = CommentRepository()
    private var userRepository = UserRepository()
    private(set) var user: User?
    
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
    
    func getUser(id: Int, action: @escaping () -> Void) {
        let onSuccess = { (user: User) in
            self.user = user
            action()
        }
        let onError = { error in print(error) }
        userRepository.fetchUsers(onSuccess: onSuccess, onError: onError, userID: id)
    }
}
