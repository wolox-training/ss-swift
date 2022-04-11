//
//  ViewsExtensions.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 07/04/2022.
//

import UIKit
import Foundation

extension UIView {
    func addSubViewWithConstraints(child: UIView, parent: UIView) {
        child.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                                     child.topAnchor.constraint(equalTo: parent.topAnchor),
                                     child.bottomAnchor.constraint(equalTo: parent.bottomAnchor),
                                     child.leadingAnchor.constraint(equalTo: parent.leadingAnchor),
                                     child.trailingAnchor.constraint(equalTo: parent.trailingAnchor)])
    }
}
