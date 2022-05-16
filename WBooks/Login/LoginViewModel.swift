//
//  LoginViewModel.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 12/05/2022.
//

import Foundation

protocol LoginViewModelProtocol {
    func writeUserDefault()
    func readUserDefault() -> Bool
}

public class LoginViewModel: LoginViewModelProtocol {
    func writeUserDefault() {
        UserDefaults.standard.set(true, forKey: "logIn")
    }
    
    func readUserDefault() -> Bool {
        let userDefault = UserDefaults.standard.bool(forKey: "logIn")
        return userDefault
    }
}
