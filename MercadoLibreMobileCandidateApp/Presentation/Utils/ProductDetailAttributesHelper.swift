//
//  ProductDetailAttributesHelper.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 1/05/25.
//

import Foundation

struct ProductDetailAttributesHelper {
    
    /// Returns a user-friendly string representation of a product's condition.
    ///
    /// - Parameter condition: The condition string received from the API (e.g., "new").
    /// - Returns: A localized string representing the condition (e.g., "Nuevo"). Defaults to "Reacondicionado" if the condition is not "new".
    public static func getConditionString(_ condition: String) -> String {
        switch condition {
        case "new":
            return "Nuevo"
            
        default:
            return "Reacondicionado"
        }
    }
    
    /// Returns a user-friendly string representation of the number of sold units for a product.
    ///
    /// - Parameter soldQuantity: The number of units sold.
    /// - Returns: A localized string indicating the sold quantity (e.g., "15 vendidos", "+100 vendidos").
    public static func getSoldQuantityString(_ soldQuantity: Int) -> String {
        if soldQuantity > 100 {
            return "+100 vendidos"
        } else {
            return "\(soldQuantity) vendidos"
        }
    }
}
