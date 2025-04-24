//
//  ProductDetailViewModel.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 23/04/25.
//

import Foundation

public final class ProductDetailViewModel: ProductDetailViewModelProtocol {
    
    var dependencies: ProductDetailViewDependencies
    
    init(dependencies: ProductDetailViewDependencies) {
        self.dependencies = dependencies
    }
}
