//
//  SuggestionsCellView.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 29/04/2022.
//

import Foundation
import WolmoCore
import Alamofire
import AlamofireImage

final class SuggestionsViewCell: UICollectionViewCell {
    @IBOutlet weak var bookCoverCollectionCell: UIImageView!
    @IBOutlet weak var collectionCellView: UIView!
    
    func setImages(url: String) {
        AF.request(url).responseImage { response in
            if case .success(let image) = response.result {
                self.bookCoverCollectionCell.image = image
            }
        }
    }
}
