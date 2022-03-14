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
        // Do any additional setup after loading the view.
    }
    
    @IBAction func logInButton(_ sender: UIButton) {
        let library = UINavigationController(rootViewController: LibraryViewController())
        library.modalPresentationStyle = .fullScreen
        present(library, animated: true)
    }
}

