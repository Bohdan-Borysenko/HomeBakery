//
//  Profile.swift
//  HomeBakery
//
//  Created by Bohdan Borysenko on 06.04.2025.
//

import Foundation
import SwiftUI

struct Profile: View {
    @Binding var isAuthenticated: Bool
    @EnvironmentObject var bakeVM: BakeViewModel

    var body: some View {
        VStack(spacing: 24) {
            Text("👤 Profile")
                .font(.largeTitle.bold())

            Button("Log Out") {
                KeychainHelper.standard.delete(key: "userEmail")
                KeychainHelper.standard.delete(key: "userPassword")
                isAuthenticated = false
            }
            .foregroundColor(.red)
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)

            List {
                ForEach(bakeVM.addedItems) { item in
                    HStack {
                        Image(item.imageName)
                            .resizable()
                            .frame(width: 50, height: 50)
                        Text(item.title)
                        Spacer()
                        Text("$\(item.price, specifier: "%.2f")")
                    }
                }
                .onDelete { indexSet in
                    indexSet.forEach { i in
                        let item = bakeVM.addedItems[i]
                        bakeVM.removeFromProfile(item)
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    Profile(isAuthenticated: .constant(true))
}
