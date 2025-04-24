//
//  MobileCandidateProductModel.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 23/04/25.
//

import Foundation

public struct MobileCandidateProductModel {
    var id: String
    var name: String
    var description: String
    var rating: Double
    var price: Double
    var imageUrl: String?
    
    init(id: String = String(), name: String = String(), description: String = String(), rating: Double = 0, price: Double = 0, imageUrl: String? = nil) {
        self.id = id
        self.name = name
        self.description = description
        self.rating = rating
        self.price = price
        self.imageUrl = imageUrl
    }
    
}
