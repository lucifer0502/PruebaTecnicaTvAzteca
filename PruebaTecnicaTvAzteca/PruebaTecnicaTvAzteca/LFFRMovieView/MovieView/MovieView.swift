//
//  ListMovieView.swift
//  PruebaTecnicaTvAzteca
//
//  Created by Fernando Flores on 18/02/26.
//

import SwiftUI

// MARK: - MovieView
struct MovieView: View {
    
    // MARK: - State Objects
    @StateObject private var viewModel: MovieViewModel
    @StateObject private var navigationManager: NavigationManger
     
    // MARK: - Initializer
    init() {
        _viewModel = StateObject(wrappedValue: MovieViewModel())
        _navigationManager = StateObject(wrappedValue: NavigationManger())
    }
    
    // MARK: - Body
    var body: some View {
        content
           
            .onAppear {
                viewModel.fetchAllCategories()
            }
            .alert("Error", isPresented: $viewModel.showErrorAlert) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(viewModel.errorMessage)
            }
    }
    
    // MARK: - Private Views
    private var content: some View {
        NavigationStack(path: $navigationManager.path) {
            ScrollView {
                VStack(spacing: 30) {
                    ForEach(MovieCategory.allCases) { category in
                        categorySection(for: category)
                    }
                }
            }
            .refreshable {
                viewModel.fetchAllCategories()
            }
            .navigationTitle("Películas")
            .navigationDestination(for: DestinationEnum.self) { destination in
                navigationManager.destination(for: destination)
            }
        }
    }
    
    private func categorySection(for category: MovieCategory) -> some View {
        MovieSectionView(
            title: category.title,
            cardConfiguration: category.cardConfiguration,
            movies: viewModel.categoryStates[category]?.movies ?? [],
            isLoading: viewModel.categoryStates[category]?.isLoading ?? false,
            navigationManager: navigationManager
        )
    }
}
