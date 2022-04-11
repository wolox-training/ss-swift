//
//  BookCommentsCell.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 29/03/2022.
//

import UIKit

final class BookCommentsCell: UITableViewCell {
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func setUpCell(viewModel: BookCommentsCellModel) {
        usernameLabel.text = viewModel.user?.username
        userImage.image = .userProfile
        commentLabel.text = viewModel.comment.content
    }
}
