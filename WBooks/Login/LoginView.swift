//
//  LoginView.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 21/03/2022.
//

import UIKit
import WolmoCore

class LoginView: NibView {
    @IBOutlet var view: UIView!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var logIn: UIButton!
    
    var onLogIn: (() -> Void)?
    
    @IBAction func logInButton(_ sender: UIButton) {
        onLogIn?()
    }
}
