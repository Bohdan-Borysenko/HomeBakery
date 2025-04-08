//
//  ContentView.swift
//  HomeBakery
//
//  Created by Bohdan Borysenko on 05.04.2025.
//

import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    @State private var scale: CGFloat = 0.8
    @State private var opacity = 0.5
    
    @Binding var isAuthenticated: Bool

    var body: some View {
        if isActive {
            MainTabView(isAuthenticated: $isAuthenticated)
        } else {
            VStack {
                Image("Logo")
                    .resizable()
                    .frame(width: 180, height: 180)

                Text("Home Bakery")
                    .font(.system(size: 36))
                    .fontWeight(.bold)
                    .foregroundColor(.brown)
                
                Text("Baked to Perfection")
                    .font(.system(size: 26))
                    .fontWeight(.medium)
                    .foregroundColor(.brown)
            }
            .scaleEffect(scale)
            .opacity(opacity)
            .onAppear {
                withAnimation(.easeIn(duration: 1.2)) {
                    self.scale = 1.0
                    self.opacity = 1.0
                }

                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
        }
    }
}

#Preview {
    SplashView(isAuthenticated: .constant(true))
}
