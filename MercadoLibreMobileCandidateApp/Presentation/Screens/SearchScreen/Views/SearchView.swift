//
//  SearchView.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 23/04/25.
//

import SwiftUI

struct SearchView<ViewModel: SearchViewModelProtocol>: View {
    
    // MARK: Properties
    @StateObject var viewModel: ViewModel
    @EnvironmentObject var navigation: MobileCandidateAppNavigation
    
    var body: some View {
        VStack {
            TopBarCustom(title: "Acá no va", showBackButton: false)
            Spacer()
            Text("Hola,")
                .fontWeight(.bold)
                .font(.title)
            Text("¿Qué deseas buscar hoy?")
            SearchBarCustom(
                text: $viewModel.query,
                hintText: "¿Quizá un celular, ropa?",
                onSearch: viewModel.onSearch
            )
            Spacer()
            Image("mercado-libre-logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
            Text("Prueba técnica")

        }
    }
}
/*
#Preview {
    SearchView()
}*/
