//
//  FooterView.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 1/05/25.
//

import Foundation
import SwiftUI

struct FooterView: View {
    var body: some View {
        VStack {
            HStack {
                Icons().mercadoLibreLogo
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 50)
                
                Text("Prueba técnica")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
            }
        }
    }
}
