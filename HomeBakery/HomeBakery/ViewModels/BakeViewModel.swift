//
//  ProfileViewModel.swift
//  HomeBakery
//
//  Created by Bohdan Borysenko on 07.04.2025.
//

import Foundation
class BakeViewModel: ObservableObject {
    @Published var allItems: [BakeItem] = [
        BakeItem(title: "Babka dough", imageName: "Item1", price: 3.99),
        BakeItem(title: "Cinnamon rolls", imageName: "Item2", price: 2.49),
        BakeItem(title: "Japanese bread", imageName: "Item3", price: 4.50),
        BakeItem(title: "Banana bread", imageName: "Item4", price: 4.50)
    ]

    @Published var addedItems: [BakeItem] = []

    @Published var searchText: String = ""

    var filteredItems: [BakeItem] {
        if searchText.isEmpty {
            return allItems
        } else {
            return allItems.filter {
                $0.title.lowercased().contains(searchText.lowercased())
            }
        }
    }

    func addToProfile(_ item: BakeItem) {
        if !addedItems.contains(item) {
            addedItems.append(item)
        }
    }

    func removeFromProfile(_ item: BakeItem) {
        addedItems.removeAll { $0 == item }
    }
}
