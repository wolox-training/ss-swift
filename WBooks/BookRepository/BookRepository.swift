//
//  BookRepository.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 22/03/2022.
//

import UIKit
import Result
import Alamofire

public class BookRepository{
    public func fetchBooks(onSuccess: @escaping ([entity]) -> Void, onError: @escaping (Error) -> Void){
        let url = URL(string: "https://ios-training-backend.herokuapp.com/api/v1/books")!
        request(url, method: .get).responseJSON{
            response in switch response.result{
            case .success(let value):
                guard let books = try?
                        JSONDecoder().decode([Book].self, from: JSONbooks) else {
                    onError(BookError.decodeError); return
                }
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
