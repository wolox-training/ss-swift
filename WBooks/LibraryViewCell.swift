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
    @IBOutlet var cellView: UIView! {
        didSet {
            cellView.backgroundColor = .white
            cellView.layer.cornerRadius = 5
        }
    }
    
    override func layoutSubviews() {
        let contentInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        cellView.frame = cellView.frame.inset(by: contentInset)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
