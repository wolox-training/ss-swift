//
//  CommentRepository.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 29/03/2022.
//

import UIKit
import Alamofire

public class CommentRepository {
    public func fetchComments(onSuccess: @escaping ([Comment]) -> Void,
                              onError: @escaping (Error) -> Void,
                              bookID: Int) {
        let url = URL(string: "https://ios-training-backend.herokuapp.com/api/v1/books/\(bookID)/comments")!
        AF.request(url, method: .get).responseDecodable(of: [Comment].self) { response in
            switch response.result {
            case .success(let comments):
                onSuccess(comments)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    enum BookError: Error {
        case decodeError
    }
}
