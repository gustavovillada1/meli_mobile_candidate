//
//  LoadingView.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 1/05/25.
//

import SwiftUI

struct LoadingView: View {
    var message: String = String()
    var subMessage: String? = nil
    var tintColor: Color = .meliBlue // Color por defecto

    var body: some View {
        ZStack {
            // Contenedor principal
            VStack(spacing: 30) {
                // CircularProgressViewStyle
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: tintColor))
                    .scaleEffect(1.5) // Ajusta el tamaño si es necesario

                // Mensaje principal
                Text(message)
                    .font(.title2)
                    .fontWeight(.semibold)

                // Sub-mensaje opcional
                if let subMessage = subMessage {
                    Text(subMessage)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .padding(30)
        }
    }
}
