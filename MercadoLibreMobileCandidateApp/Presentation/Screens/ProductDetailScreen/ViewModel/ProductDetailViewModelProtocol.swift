//
//  ProductDetailViewModelProtocol.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 23/04/25.
//

import Foundation

protocol ProductDetailViewModelProtocol: ObservableObject {
    
    // MARK: Objects
    var localizables: AppLocalizables { get }
    var dependencies: ProductDetailViewDependencies { get }
    var appError: AppError? { get set }
    var shouldLoadFromJSON: Bool { get set }
    var productDetail: ProductDetailModel? { get set }
    var getProductDetailsUseCase: GetProductDetailsUseCaseProtocol { get }
    var shouldShowLoader: Bool { get set }
    
    // MARK: Functions
    func onAppear()
    func getProductDetailsAPI()
    func didTapOnGetJson()
}
