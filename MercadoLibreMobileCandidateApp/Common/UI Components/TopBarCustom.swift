//
//  TopBarCustom.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 23/04/25.
//

import SwiftUI

struct TopBarCustom: View {
    let title: String
    let showBackButton: Bool
    var onBack: (() -> Void)? = nil

    var body: some View {
        HStack {
            if showBackButton {
                Button(action: {
                    onBack?()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.blue)
                        .padding(.leading)
                }
            } else {
                Spacer().frame(width: UIConstants().topBarHeight)
            }
            Spacer()
            Text(title)
                .font(.headline)
                .bold()
            Spacer()
            Spacer().frame(width: UIConstants().topBarHeight)
        }
        .frame(height: UIConstants().topBarHeight)
        .background(Color(UIColor.systemBackground))
        .overlay(Divider(), alignment: .bottom)
    }
}

#Preview {
    TopBarCustom(title: "Title", showBackButton: true)
}
