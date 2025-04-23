//
//  SearchBarCustom.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 23/04/25.
//

import SwiftUI

struct SearchBarCustom: View {
    @Binding var text: String
    var hintText: String
    var onSearch: () -> Void
    
    var body: some View {
        HStack(spacing: 10) {
            TextField(hintText, text: $text)
                .padding(12)
                .cornerRadius(10)
                .shadow(color: .gray.opacity(0.2), radius: 4, x: 0, y: 2)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray4), lineWidth: 0.5)
                )
                .onSubmit {
                    onSearch()
                }
            
            Button(action: {
                onSearch()
            }) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.white)
                    .padding(12)
                    .background(Color.yellow)
                    .clipShape(Circle())
                    .shadow(color: .gray.opacity(0.3), radius: 4, x: 0, y: 2)
            }
        }
        .padding(.horizontal)
    }
}
