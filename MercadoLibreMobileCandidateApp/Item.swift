//
//  Item.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 22/04/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
