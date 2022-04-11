//
//  BookCommentsCellModel.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 11/04/2022.
//

import Foundation

protocol BookCommentsCellProtocol {
    var comment: Comment { get set }
    var user: User? { get set }
    func getUser(action: @escaping () -> Void)
}

public class BookCommentsCellModel: BookCommentsCellProtocol {
    var user: User?
    var comment: Comment
    private var userRepository: UserRepositoryProtocol

    init(comment: Comment, userRepository: UserRepository = UserRepository()) {
        self.comment = comment
        self.userRepository = userRepository
    }
    
    func getUser(action: @escaping () -> Void) {
        let onSuccess = { (user: User) in
            self.user = user
            action()
        }
        let onError = { error in print(error) }
        userRepository.fetchUsers(onSuccess: onSuccess, onError: onError, userID: self.comment.userID)
    }
}
