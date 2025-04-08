//
//  HomeBakeryApp.swift
//  HomeBakery
//
//  Created by Bohdan Borysenko on 05.04.2025.
//

import SwiftUI

@main
struct HomeBakeryApp: App {
    @AppStorage("isAuthenticated") var isAuthenticated: Bool = false
    @StateObject var bakeVM = BakeViewModel()
    
    init() {
        AppAppearance.setup()
    }

    var body: some Scene {
        WindowGroup {
            SplashView(isAuthenticated: $isAuthenticated)
                            .environmentObject(bakeVM)
        }
    }
}
