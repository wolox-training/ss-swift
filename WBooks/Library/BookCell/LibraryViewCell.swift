//
//  LibraryViewCell.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 03/03/2022.
//

import UIKit
import WolmoCore

final class LibraryViewCell: UITableViewCell {
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookCover: UIImageView!
    @IBOutlet weak var bookAuthor: UILabel!
    @IBOutlet weak var cellView: UIView! {
        didSet {
            cellView.backgroundColor = .white
            cellView.addShadow(radius: 1)
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let contentInset = UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 20)
        cellView.layer.frame = cellView.frame.inset(by: contentInset)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setUpCell(book: Book) {
        bookTitle.text = book.title
        bookAuthor.text = book.author
        bookCover.image = .cover
    }
}
