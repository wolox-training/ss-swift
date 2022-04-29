//
//  BookSuggestionsCardViewModel.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 28/04/2022.
//

import Foundation

protocol BookSuggestionsCardViewProtocol {
    func getSuggestions(action: @escaping () -> Void)
    var suggestions: [Suggestion] { get set }
}

final class BookSuggestionsCardViewModel: BookSuggestionsCardViewProtocol {
    var suggestions: [Suggestion] = []
    private var repository = SuggestionRepository()
    
    func getSuggestions(action: @escaping () -> Void) {
        let onSuccess = { (suggestions: [Suggestion]) in
            self.suggestions = suggestions
            self.suggestions.removeAll(where: { suggestion in
                let link = suggestion.link
                return link == "https://www.google.com/"
            })
            action()
        }
        let onError = { error in print(error) }
        repository.fetchSuggestions(onSuccess: onSuccess, onError: onError)
    }
}
