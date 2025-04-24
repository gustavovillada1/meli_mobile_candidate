//
//  SearchViewModel.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 23/04/25.
//

import Foundation
import Combine

public final class SearchViewModel: SearchViewModelProtocol {
    
    // MARK: Non observables
    let searchProductsUseCase: SearchProductsUseCaseProtocol
    var products: [MobileCandidateProductModel] = []
    var productSelected: MobileCandidateProductModel = MobileCandidateProductModel()
    private var cancellables: Set<AnyCancellable> = Set<AnyCancellable>()

    // MARK: Observables
    @Published var query: String = String()
    @Published var shouldShowSkeleton: Bool = true
    @Published var shouldShowAlert: Bool = false
    
    // MARK: Initializer
    init(searchProductsUseCase: SearchProductsUseCaseProtocol) {
        self.searchProductsUseCase = searchProductsUseCase
    }
    
    // MARK: Functions
    func onAppear() { }
    
    func onSearch() {
        shouldShowSkeleton = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.searchProductsUseCase.execute(query: self.query)
                .receive(on: DispatchQueue.main)
                .sink(
                    receiveCompletion: { [weak self] response in
                        
                        switch response {
                            
                        case .finished:
                            self?.onSearchFinished()
                        case .failure(_):
                            self?.onSearchFailure()
                        }
                    }, receiveValue: { products in
                        self.products = [
                            MobileCandidateProductModel(
                                  id: "1",
                                  name: "iPhone 14",
                                  description: "Último modelo de Apple",
                                  rating: 4.8,
                                  price: 999.99,
                                  imageUrl: "https://www.clevercel.co/cdn/shop/files/Caracteristica_capacidad_iphone_14_Plus_2024_1024x1024.webp?v=1734121396"
                              ),
                              MobileCandidateProductModel(
                                  id: "2",
                                  name: "Samsung Galaxy S23",
                                  description: "Smartphone de gama alta",
                                  rating: 4.6,
                                  price: 899.99,
                                  imageUrl: "https://www.clevercel.co/cdn/shop/files/samsung-galaxy-s23-ultra-5g-1_636x.jpg?v=1744750843"
                              ),
                              MobileCandidateProductModel(
                                  id: "3",
                                  name: "MacBook Pro M3",
                                  description: "Portátil potente para profesionales",
                                  rating: 4.9,
                                  price: 1999.99,
                                  imageUrl: "https://www.apple.com/newsroom/images/2024/03/apple-unveils-the-new-13-and-15-inch-macbook-air-with-the-powerful-m3-chip/article/Apple-MacBook-Air-2-up-hero-240304_big.jpg.large.jpg"
                              ),
                              MobileCandidateProductModel(
                                  id: "4",
                                  name: "AirPods Pro",
                                  description: "Auriculares inalámbricos con cancelación de ruido",
                                  rating: 4.7,
                                  price: 249.99,
                                  imageUrl: "https://mac-center.com/cdn/shop/files/AirPods_Pro_en_su_estuche_con_MagSafe.jpg?v=1742255727&width=823"
                              )]
                    }
                )
                .store(in: &self.cancellables)
        }
    }
    
    private func onSearchFinished() {
        shouldShowSkeleton = false
    }
    
    private func onSearchFailure() {
        shouldShowSkeleton = false
        shouldShowAlert = true
    }
}
