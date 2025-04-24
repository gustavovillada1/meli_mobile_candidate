//
//  TopBarCustom.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 23/04/25.
//

import SwiftUI

struct TopBarCustom: View {
    let title: String
    var onBack: (() -> Void)? = nil
    var trailingIcon: Image? = Icons().search
    var trailingAction: (() -> Void)? = nil
    
    var body: some View {
        HStack {
            if let onBack: () -> Void = onBack {
                Button(action: {
                    onBack()
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
            if let trailingAction: () -> Void = trailingAction {
                Button(action: {
                    trailingAction()
                }) {
                    trailingIcon
                        .foregroundColor(.blue)
                        .padding(.leading)
                }
                .padding(.trailing, UIConstants().trailingIconPadding)
            } else {
                Spacer().frame(width: UIConstants().topBarHeight)
            }
        }
        .frame(height: UIConstants().topBarHeight)
        .background(Color(UIColor.systemBackground))
        .overlay(Divider(), alignment: .bottom)
    }
}

#Preview {
    TopBarCustom(title: "Title")
}
