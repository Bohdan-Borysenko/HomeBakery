//
//  BakeItem.swift
//  HomeBakery
//
//  Created by Bohdan Borysenko on 08.04.2025.
//

import Foundation

struct BakeItem: Identifiable, Equatable, Codable {
    let id = UUID()
    let title: String
    let imageName: String
    let price: Double
}
