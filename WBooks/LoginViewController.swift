//
//  LoginViewController.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 20/01/2022.
//

import UIKit

class LoginViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func logInButton(_ sender: UIButton) {
        let tabBar = TabBarController()
        tabBar.modalPresentationStyle = .fullScreen
        present(tabBar, animated: true)
    }
}

