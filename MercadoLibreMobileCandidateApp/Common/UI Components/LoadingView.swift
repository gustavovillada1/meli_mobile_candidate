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
    var tintColor: Color = .meliBlue
    
    var body: some View {
        ZStack {
            VStack(spacing: 30) {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: tintColor))
                    .scaleEffect(1.5)
                Text(message)
                    .font(.title2)
                    .fontWeight(.semibold)
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
