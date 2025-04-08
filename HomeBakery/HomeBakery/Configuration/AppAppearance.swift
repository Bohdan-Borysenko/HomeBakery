//
//  AppAppearance.swift
//  HomeBakery
//
//  Created by Bohdan Borysenko on 07.04.2025.
//

import Foundation
import UIKit

struct AppAppearance {
    static func setup() {
        // Убедись, что у тебя есть цвет "brown" в Assets.xcassets
        if let brownColor = UIColor(named: "brown") {
            UITabBar.appearance().tintColor = brownColor  // Цвет выбранного элемента
            UITabBar.appearance().unselectedItemTintColor = UIColor.gray // Цвет невыбранных вкладок
            UITabBarItem.appearance().badgeColor = brownColor // Цвет бейджа
        } else {
            print("Цвет 'brown' не найден в Assets.xcassets")
        }
    }
}
