//
//  Mane.swift
//  HomeBakery
//
//  Created by Bohdan Borysenko on 07.04.2025.
//

import Foundation
import SwiftUI

struct BakeView: View {
    @EnvironmentObject var bakeVM: BakeViewModel

    var body: some View {
        NavigationView {
            List(bakeVM.filteredItems) { item in
                HStack {
                    Image(item.imageName)
                        .resizable()
                        .frame(width: 60, height: 60)

                    VStack(alignment: .leading) {
                        Text(item.title)
                            .font(.headline)
                        Text("$\(item.price, specifier: "%.2f")")
                            .font(.subheadline)
                    }

                    Spacer()

                    Button(action: {
                        bakeVM.addToProfile(item)
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.brown)
                            .font(.title2)
                    }
                }
                .padding(.vertical, 8)
            }
            .navigationTitle("Bake")
            .searchable(text: $bakeVM.searchText, prompt: "Search bakery...")
        }
    }
}

#Preview {
    Profile(isAuthenticated: .constant(true))
        .environmentObject(BakeViewModel())
}
