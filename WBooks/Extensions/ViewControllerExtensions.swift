//
//  ViewControllerExtensions.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 06/05/2022.
//

import UIKit

extension UIViewController {
    func showSpinner(view: UIView, loadingView: UIView, spinner: UIActivityIndicatorView) {
        DispatchQueue.main.async {
            loadingView.frame = CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0)
            loadingView.center = view.center
            loadingView.backgroundColor = .backgroundGray
            loadingView.alpha = 0.7
            loadingView.clipsToBounds = true
            loadingView.layer.cornerRadius = 10
            spinner.frame = CGRect(x: 0.0, y: 0.0, width: 80.0, height: 80.0)
            spinner.center = CGPoint(x: loadingView.bounds.size.width / 2, y: loadingView.bounds.size.height / 2)
            loadingView.addSubview(spinner)
            view.addSubview(loadingView)
            spinner.startAnimating()
        }
    }
    
    func removeSpinner(loadingView: UIView, spinner: UIActivityIndicatorView) {
        DispatchQueue.main.async {
            spinner.stopAnimating()
            loadingView.removeFromSuperview()
        }
    }
}
