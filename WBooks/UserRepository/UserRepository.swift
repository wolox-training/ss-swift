//
//  UserRepository.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 30/03/2022.
//

import Foundation
import Alamofire

public class UserRepository {
    public func fetchUsers(onSuccess: @escaping (User) -> Void,
                           onError: @escaping (Error) -> Void,
                           userID: Int) {
        let url = URL(string: "https://ios-training-backend.herokuapp.com/api/v1/users/\(userID)")!
        AF.request(url, method: .get).responseDecodable(of: User.self) { response in
            switch response.result {
            case .success(let user):
                onSuccess(user)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    enum BookError: Error {
        case decodeError
    }
}
