//
//  SearchView.swift
//  MercadoLibreMobileCandidateApp
//
//  Created by Gustavo Adolfo Villada Molina on 23/04/25.
//

import SwiftUI

struct SearchView<ViewModel: SearchViewModelProtocol>: View {
    
    // MARK: Properties
    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel: ViewModel
    @EnvironmentObject var navigation: MobileCandidateAppNavigation
    
    // MARK: - Body
    var body: some View {
        ZStack {
            backgroundMeli
            VStack {
                Spacer()
                contentView
                Spacer()
                footerView
            }
            NavigationLink(
                destination: ResultViewWireframe.getResultView(viewModel: viewModel as! SearchViewModel),
                isActive: $navigation.isResultsViewActive,
                label: {}
            )
        }
        .onAppear {
            viewModel.cleanProducts()
        }
    }
    
    // MARK: - Content View
    private var contentView: some View {
        VStack(spacing: viewModel.constants.mainCardVerticalSpacing) {
            Text(viewModel.localizables.searchScreenHelloString)
                .fontWeight(.semibold)
                .font(.title)
                .foregroundColor(.meliBlue)
            
            Text(viewModel.localizables.searchScreenHelloSubtitleString)
                .font(.title3)
                .foregroundColor(.gray)
            
            SearchBarCustom(
                text: $viewModel.query,
                hintText: viewModel.localizables.searchScreenTextFieldHintString,
                onSearch: {
                    navigation.isResultsViewActive = true
                    viewModel.onSearch()
                }
            )
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .padding(viewModel.constants.mainCardInternalPadding)
        .background(Color.white)
        .cornerRadius(viewModel.constants.mainCardCornerRadius)
        .shadow(color: .gray.opacity(0.3), radius: 8, x: 0, y: 4)
        .padding(.horizontal, viewModel.constants.mainCardHorizontalPadding)
    }
    
    // MARK: - Background View
    private var backgroundMeli: some View {
        ZStack {
            GeometryReader { geometry in
                Image("mercado_libre_background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .overlay(
                        Color.black.opacity(0.4)
                    )
            }
            .ignoresSafeArea()
        }
    }
    
    // MARK: - Footer View
    private var footerView: some View {
        FooterView()
    }
}

