//
//  AuthViewModel.swift
//  HomeBakery
//
//  Created by Bohdan Borysenko on 07.04.2025.
//

import Foundation
import SwiftUI

class AuthViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""

    @AppStorage("isAuthenticated") var isAuthenticated: Bool = false

    init() {
        let storedEmail = KeychainService.shared.get(key: "userEmail")
        let storedPassword = KeychainService.shared.get(key: "userPassword")

        if storedEmail != nil && storedPassword != nil {
            isAuthenticated = true
        }
    }

    func login() {
        let storedEmail = KeychainService.shared.get(key: "userEmail")
        let storedPassword = KeychainService.shared.get(key: "userPassword")

        if email == storedEmail && password == storedPassword {
            isAuthenticated = true
        } else {
            print("Неверный логин или пароль")
        }
    }

    func register() {
        KeychainService.shared.set(key: "userEmail", value: email)
        KeychainService.shared.set(key: "userPassword", value: password)
        isAuthenticated = true
    }

    func logout() {
        KeychainService.shared.delete(key: "userEmail")
        KeychainService.shared.delete(key: "userPassword")
        isAuthenticated = false
    }
}
