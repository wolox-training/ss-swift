//
//  SuggestionRepository.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 28/04/2022.
//

import Alamofire

protocol SuggestionRepositoryProtocol {
    func fetchSuggestions(onSuccess: @escaping ([Suggestion]) -> Void, onError: @escaping (Error) -> Void)
}

internal class SuggestionRepository: SuggestionRepositoryProtocol {
    public func fetchSuggestions(onSuccess: @escaping ([Suggestion]) -> Void, onError: @escaping (Error) -> Void) {
        let url = URL(string: "https://ios-training-backend.herokuapp.com/api/v1/suggestions")!
        AF.request(url, method: .get).responseDecodable(of: [Suggestion].self) { response in
            switch response.result {
            case .success(let suggestions):
                onSuccess(suggestions)
            case .failure(let error):
                onError(error)
            }
        }
    }

    enum BookError: Error {
        case decodeError
    }
}
