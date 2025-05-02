//
//  Routable.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 1/05/25.
//

import Foundation

public typealias ServiceParameters = Encodable
public typealias HTTPHeaders = [String: String]

protocol Routable {
    var httpMethod: String { get }
    var parameters: ServiceParameters? { get }
    var headers: HTTPHeaders? { get }
}

enum AppRoutable: Routable {
    var headers: HTTPHeaders? { nil }
    
    var parameters: ServiceParameters? {
        switch self {
            
        case .retrieveSearchProduct(let query):
            return query
        case .retrieveGetProductDetails(let productId):
            return productId
        }
    }
    
    var httpMethod: String {
        switch self {
            
        case .retrieveSearchProduct, .retrieveGetProductDetails:
            return "GET"
        }
    }
    
    struct constants {
        static let searchProductPath: String = ""
        static let getProductDetail: String = ""
    }
    
    // MARK: - API Services
    case retrieveSearchProduct(String)
    case retrieveGetProductDetails(String)
    
    var servicePath: String {
        switch self {
            
        case .retrieveSearchProduct(_):
            return constants.searchProductPath
        case .retrieveGetProductDetails(_):
            return constants.getProductDetail
        }
    }
    
}
