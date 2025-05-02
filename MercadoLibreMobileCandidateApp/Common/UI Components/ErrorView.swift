//
//  ErrorView.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 1/05/25.
//

import SwiftUI

struct ErrorView: View {
    private let error: AppError
    private let didTapOnRetry: (() -> Void)?
    private let didTapOnCallJson: (() -> Void)?
    
    init(
        error: AppError,
        didTapOnRetry: ( () -> Void)? = nil,
        didTapOnCallJson: ( () -> Void)? = nil
    ) {
        self.error = error
        self.didTapOnRetry = didTapOnRetry
        self.didTapOnCallJson = didTapOnCallJson
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer() // Empuja el contenido hacia el centro
            
            Image(systemName: "exclamationmark.triangle.fill") // Icono más moderno
                .font(.system(size: 50))
                .foregroundColor(.orange) // Color más suave
            
            Text("¡Oops! Algo salió mal")
                .font(.title2) // Fuente más grande
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            Text(error.localizedDescription)
                .font(.body) // Fuente más legible
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30) // Más padding horizontal
            
            VStack(spacing: 15) {
                if let retry = didTapOnRetry {
                    Button(action: {
                        retry()
                    }) {
                        Text("Reintentar")
                            .font(.headline)
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                            .padding(.horizontal, 30)
                            .padding(.vertical, 12)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                }
                
                if let callJson = didTapOnCallJson {
                    VStack {
                        Text("¿Deseas simular una respuesta desde un JSON?")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 30)
                            .padding(.top, 60)
                        
                        Button(action: {
                            callJson()
                        }) {
                            Text("Simular con JSON")
                                .font(.headline)
                                .fontWeight(.medium)
                                .foregroundColor(.blue)
                                .padding(.horizontal, 30)
                                .padding(.vertical, 12)
                                .background(Color.white)
                                .cornerRadius(10)
                        }
                    }
                }
            }
            .padding(.top, 20)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBackground))
        .edgesIgnoringSafeArea(.all)
    }
}
