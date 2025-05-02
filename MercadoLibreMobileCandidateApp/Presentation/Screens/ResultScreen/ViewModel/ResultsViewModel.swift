//
//  ResultsViewModel.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 23/04/25.
//

import Foundation

extension SearchViewModel {
    
    /// Handles the action when a product item in the search results is tapped.
    /// Stores the ID of the selected product.
    ///
    /// - Parameter productId: The unique identifier of the tapped product.
    func didTapOnElement(for productId: String) {
        productIdSelected = productId
    }
    
    /// Clears the `products` array, removing all currently displayed search results.
    func cleanProducts() {
        if !products.isEmpty {
            products.removeAll()
        }
    }
    
    /// Triggers a new search, forcing the data to be loaded from a local JSON file (if enabled).
    func didTapOnGetJson() {
        self.shouldLoadFromJSON = true
        self.onSearch()
    }
    
    /// Handles the action when the cancel button on an alert is tapped.
    /// Resets the `shouldLoadFromJSON` flag.
    func didTapOnCancelAlert() {
        self.shouldLoadFromJSON = false
    }
}
