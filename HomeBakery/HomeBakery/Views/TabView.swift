//
//  MainView.swift .swift
//  HomeBakery
//
//  Created by Bohdan Borysenko on 06.04.2025.
//

import Foundation
import SwiftUI

struct MainTabView: View {
    @Binding var isAuthenticated: Bool
    @State private var selectedTab: Tab = .bake
    @State private var showAuth: Bool = false
    
    enum Tab {
        case bake, courses, profile
    }

    var body: some View {
        ZStack {
            TabView(selection: $selectedTab) {
                BakeView()
                    .tabItem {
                        Image("TabLogo")
                        Text("Bake")
                    }
                    .tag(Tab.bake)

                Courses()
                    .tabItem {
                        Image("Courses")
                        Text("Courses")
                    }
                    .tag(Tab.courses)

                Profile(isAuthenticated: $isAuthenticated)
                    .tabItem {
                        Image("profil")
                        Text("Profile")
                    }
                    .tag(Tab.profile)
            }
            .onChange(of: selectedTab) { tab in
                if tab == .profile && !isAuthenticated {
                    showAuth = true
                }
            }

            if showAuth {
                AuthView(isAuthenticated: $isAuthenticated)
                    .zIndex(1)
            }
        }
        .onChange(of: isAuthenticated) { loggedIn in
            if loggedIn {
                showAuth = false
            }
        }
    }
}

#Preview {
    MainTabView(isAuthenticated: .constant(true))
}

