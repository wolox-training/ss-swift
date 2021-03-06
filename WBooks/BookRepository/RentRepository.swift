//
//  BookRents.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 28/03/2022.
//

import Foundation
import Alamofire

protocol RentRepositoryProtocol {
    func rentBook(onSuccess: @escaping (RentResponse) -> Void,
                  onError: @escaping (Error) -> Void,
                  parameters: Rent,
                  userID: Int)
    func fetchRentals(onSuccess: @escaping ([RentResponse]) -> Void, onError: @escaping (Error) -> Void, userID: Int)
}

internal class RentRepository: RentRepositoryProtocol {
    public func rentBook(onSuccess: @escaping (RentResponse) -> Void,
                         onError: @escaping (Error) -> Void,
                         parameters: Rent,
                         userID: Int) {
        let url = URL(string: "https://private-deb86-wbooksiostraining.apiary-mock.com/users/\(userID)/rents")!
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
    
    public func fetchRentals(onSuccess: @escaping ([RentResponse]) -> Void,
                             onError: @escaping (Error) -> Void,
                             userID: Int) {
        let url = URL(string: "https://ios-training-backend.herokuapp.com/api/v1/users/\(userID)/rents")!
        AF.request(url, method: .get).responseDecodable(of: [RentResponse].self) { response in
            switch response.result {
            case .success(let rents):
                onSuccess(rents)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    enum BookError: Error {
        case decodeError
    }
}
