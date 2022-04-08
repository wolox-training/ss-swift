//
//  ButtonsExtensions.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 07/04/2022.
//

import Foundation
import UIKit

extension UIButton {
    func applyGradient() {
        layer.masksToBounds =  true
        layer.cornerRadius = 20
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor(red: 0, green: 0.678, blue: 0.925, alpha: 1).cgColor,
            UIColor(red: 0.224, green: 0.802, blue: 0.804, alpha: 1).cgColor
          ]
        gradientLayer.locations = [0, 1]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        gradientLayer.frame = bounds
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    private func setupGeneral(_ titleColor: UIColor) {
            setTitleColor(titleColor, for: .normal)
            layer.masksToBounds =  true
            layer.cornerRadius = 20
    }

    func withGradient() {
        setupGeneral(.white)
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.pictonBlue.cgColor, UIColor.downy.cgColor]
        gradientLayer.locations = [0, 1]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        gradientLayer.frame = bounds
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
