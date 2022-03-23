//
//  BookRepository.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 22/03/2022.
//

import UIKit
import Alamofire

public class BookRepository {
    public func fetchBooks(onSuccess: @escaping ([Book]) -> Void, onError: @escaping (Error) -> Void) {
        let url = URL(string: "https://ios-training-backend.herokuapp.com/api/v1/books")!
        AF.request(url, method: .get).responseDecodable(of: [Book].self) { response in
            switch response.result {
            case .success(let books):
                onSuccess(books)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    enum BookError: Error {
        case decodeError
    }
}
