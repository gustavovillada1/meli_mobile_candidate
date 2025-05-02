//
//  ListTileCustom.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 23/04/25.
//

import SwiftUI

struct ListTileCustom: View {
    private var title: String
    private var subtitle: String?
    private var price: String?
    private var imageUrl: String?
    private var trailingImage: Image?
    private var trailingAction: (() -> Void)?
    private var onTap: (() -> Void)?
    private var constants: UIConstants = UIConstants()
    
    init(_ title: String) {
        self.title = title
    }
    
    var body: some View {
        Button(action: {
            onTap?()
        }) {
        HStack(spacing: constants.horizontalSpacingTen) {
            if let imageUrl = imageUrl, let url = URL(string: imageUrl) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: constants.imageSize, height: constants.imageSize)
                .cornerRadius(constants.imageCornerRadius)
            }
            
            VStack(alignment: .leading, spacing: constants.spacingTwo) {
                Text(title)
                     .font(.subheadline)
                     .fontWeight(.semibold)
                     .foregroundColor(.primary)
                     .lineLimit(2)
                
                if let subtitle = subtitle {
                    Text(subtitle)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                if let price = price {
                    Text(price)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(Color.meliGreen) // Usando el color definido
                        .lineLimit(1)
                }
            }
            Spacer()
            if let trailing = trailingImage {
                Button(action: {
                    trailingAction?()
                }) {
                    trailing
                        .foregroundColor(.gray)
                }
                .buttonStyle(BorderlessButtonStyle())
            }
        }
        .padding(constants.internalPadding)
        .background(Color.white)
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    // MARK: - Builder Methods
    
    func subtitle(_ text: String) -> ListTileCustom {
        var copy = self
        copy.subtitle = text
        return copy
    }
    
    func price(_ text: String) -> ListTileCustom {
        var copy = self
        copy.price = text
        return copy
    }
    
    func imageUrl(_ url: String) -> ListTileCustom {
        var copy = self
        copy.imageUrl = url
        return copy
    }
    
    func trailing(image: Image, action: @escaping () -> Void) -> ListTileCustom {
        var copy = self
        copy.trailingImage = image
        copy.trailingAction = action
        return copy
    }
    
    func onTap(_ action: @escaping () -> Void) -> ListTileCustom {
        var copy = self
        copy.onTap = action
        return copy
    }
}


// Ejemplo de uso
#Preview {
    VStack {
        ListTileCustom("iPhone 15 Pro Max")
            .subtitle("Apple Store")
            .price("$1.199 USD")
            .imageUrl("https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-15-pro-model-unselect-gallery-1-202309_FMT_WHH?wid=5120&hei=2880&fmt=jpeg&qlt=80&.v=1693010713108")
            .trailing(image: Image(systemName: "chevron.right"), action: {
                print("Tapped")
            })
        
        ListTileCustom("Solo Título")
            .price("$1.199 USD")
    }
}
