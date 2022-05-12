//
//  LoginViewController.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 20/01/2022.
//

import UIKit
import WolmoCore

final class LoginViewController: UIViewController {
    private let loginView = LoginView()
    private let loginViewModel: LoginViewModelProtocol
    
    init(loginViewModel: LoginViewModel) {
        self.loginViewModel = loginViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = loginView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if loginViewModel.readUserDefault() {
            logInButton()
        }
        loginView.onLogIn = logInButton
    }

    func logInButton() {
        let tabBar = TabBarController()
        tabBar.modalPresentationStyle = .fullScreen
        loginViewModel.writeUserDefault()
        present(tabBar, animated: true)
    }
}
