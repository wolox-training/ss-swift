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
        setupGeneral(.white)
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.pictonBlue.cgColor,
            UIColor.downy.cgColor
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
}
