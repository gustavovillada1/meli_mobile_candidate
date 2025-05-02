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
    
    @State private var isSearchEnabled = false
    @State private var isEditing = false
    
    var body: some View {
        HStack {
            TextField(hintText, text: $text, onEditingChanged: { editing in
                isEditing = editing
            })
            .padding(7)
            .padding(.horizontal, 25)
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .overlay(
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 8)
                    
                    if isEditing {
                        Button(action: {
                            text = ""
                        }) {
                            Image(systemName: "multiply.circle.fill")
                                .foregroundColor(.gray)
                                .padding(.trailing, 8)
                        }
                    }
                }
            )
            .onAppear {
                isSearchEnabled = text.count >= 3
            }
            .onChange(of: text) {
                isSearchEnabled = text.count >= 3
            }
            
            Button(action: {
                if isSearchEnabled {
                    onSearch()
                }
            }) {
                Text("Buscar")
                    .padding(7)
                    .background(isSearchEnabled ? Color.blue : Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .disabled(!isSearchEnabled)
        }
    }
}
