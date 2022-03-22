//
//  LoginViewController.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 20/01/2022.
//

import UIKit
import WolmoCore

class LoginViewController: UIViewController {
    private let loginView = LoginView()

    override func loadView() {
        view = loginView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.onLogIn = logInButton
    }

    func logInButton() {
        let tabBar = TabBarController()
        tabBar.modalPresentationStyle = .fullScreen
        present(tabBar, animated: true)
    }
}
