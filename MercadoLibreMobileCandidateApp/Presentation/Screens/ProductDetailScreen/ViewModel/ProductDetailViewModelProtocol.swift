//
//  ProductDetailViewModelProtocol.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 23/04/25.
//

import Foundation

protocol ProductDetailViewModelProtocol: ObservableObject {
    
    var dependencies: ProductDetailViewDependencies { get }
    
}
