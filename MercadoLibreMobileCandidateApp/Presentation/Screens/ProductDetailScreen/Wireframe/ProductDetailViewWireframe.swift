//
//  ProductDetailViewWireframe.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 23/04/25.
//

import SwiftUI

public struct ProductDetailViewWireframe {
    
    @ViewBuilder
    public static func getProductDetailView(with product: MobileCandidateProductModel) -> some View {
        let viewModel: ProductDetailViewModel = createViewModel(with: product)
        let productDetailView: ProductDetailView = ProductDetailView(viewModel: viewModel)
        
        productDetailView
        .navigationBarHidden(true)
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    private static func createViewModel(with product: MobileCandidateProductModel) -> ProductDetailViewModel {
        
        let dependencies: ProductDetailViewDependencies = ProductDetailViewDependencies(product: product)
        return ProductDetailViewModel(dependencies: dependencies)
    }
}
