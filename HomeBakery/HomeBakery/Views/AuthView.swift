//
//  AuthView.swift
//  HomeBakery
//
//  Created by Bohdan Borysenko on 08.04.2025.
//

import Foundation
import SwiftUI

struct AuthView: View {
    @Binding var isAuthenticated: Bool
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        VStack {
            Spacer()

            VStack(spacing: 16) {
                Text("Login to your account")
                    .font(.title2)
                    .bold()

                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Button("Login") {
                    if email != "" && password != "" {
                        KeychainHelper.standard.save(email: email, password: password)
                        isAuthenticated = true
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.brown)
                .foregroundColor(.white)
                .cornerRadius(12)
                
                Text("Don’t have an account? Sign Up")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            .padding(24)
            .background(Color.white)
            .cornerRadius(30)
            .frame(maxWidth: .infinity)
            .frame(maxHeight: UIScreen.main.bounds.height * 0.8)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.4).ignoresSafeArea())
        .transition(.move(edge: .bottom))
        .animation(.easeInOut, value: isAuthenticated)
    }
}

