//
//  BookRents.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 28/03/2022.
//

import Foundation

import UIKit
import Alamofire

public class RentRepository {
    public func rentBook(onSuccess: @escaping (RentResponse) -> Void,
                         onError: @escaping (Error) -> Void,
                         parameters: Rent) {
        let url = URL(string: "https://private-deb86-wbooksiostraining.apiary-mock.com/users/10/rents")!
        AF.request(url, method: .post, parameters: parameters,
                   encoder: JSONParameterEncoder.default)
        .responseDecodable(of: RentResponse.self) { response in
            switch response.result {
            case .success(let rent):
                onSuccess(rent)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    enum BookError: Error {
        case decodeError
    }
}
