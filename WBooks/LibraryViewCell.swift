//
//  LibraryViewCell.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 03/03/2022.
//

import UIKit

class LibraryViewCell: UITableViewCell {


    @IBOutlet var bookTitle: UILabel!
    @IBOutlet var bookCover: UIImageView!
    @IBOutlet var bookAuthor: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
