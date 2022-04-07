//
//  ButtonsExtensions.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 07/04/2022.
//

import Foundation
import UIKit
import WolmoCore

extension UIButton {
    func applyGradient() {
        self.backgroundColor = nil
        self.tintColor = nil
        self.layoutIfNeeded()
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor(hex: "#00ADEC")!.cgColor,
            UIColor(hex: "#39CCCD")!.cgColor
          ]
        gradientLayer.locations = [0, 1]
        gradientLayer.startPoint = CGPoint(x: 0.25, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 0.75, y: 0.5)
        self.layer.addSublayer(gradientLayer)
    }
}
