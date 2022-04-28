//
//  BookRepository.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 22/03/2022.
//

import Alamofire

protocol BookRepositoryProtocol {
    func fetchBooks(onSuccess: @escaping ([Book]) -> Void, onError: @escaping (Error) -> Void)
    func addBook(onSuccess: @escaping (Book) -> Void, onError: @escaping (Error) -> Void,
                 parameters: Book)
    func getBook(onSuccess: @escaping (Book) -> Void, onError: @escaping (Error) -> Void, bookId: Int)
}

internal class BookRepository: BookRepositoryProtocol {
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
    
    public func addBook( onSuccess: @escaping (Book) -> Void,
                         onError: @escaping (Error) -> Void,
                         parameters: Book) {
        let url = URL(string: "https://ios-training-backend.herokuapp.com/api/v1/books")!
        AF.request(url, method: .post, parameters: parameters,
                   encoder: JSONParameterEncoder.default)
        .responseDecodable(of: Book.self) { response in
            switch response.result {
            case .success(let book):
                onSuccess(book)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    public func getBook(onSuccess: @escaping (Book) -> Void, onError: @escaping (Error) -> Void, bookId: Int) {
        let url = URL(string: "https://ios-training-backend.herokuapp.com/api/v1/books/\(bookId)")!
        AF.request(url, method: .get).responseDecodable(of: Book.self) { response in
            switch response.result {
            case .success(let book):
                onSuccess(book)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    enum BookError: Error {
        case decodeError
    }
}
