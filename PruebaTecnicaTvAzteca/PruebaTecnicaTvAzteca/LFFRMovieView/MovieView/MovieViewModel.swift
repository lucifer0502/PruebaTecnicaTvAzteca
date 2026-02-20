//
//  ListMovieViewModel.swift
//  PruebaTecnicaTvAzteca
//
//  Created by Fernando Flores on 18/02/26.
//

import Foundation

@MainActor
final class MovieViewModel: ObservableObject {
    
    // MARK: - Published Properties
    @Published var categoryStates: [MovieCategory: MovieCategoryState] = [:]
    @Published var errorMessage: String = ""
    @Published var showErrorAlert: Bool = false
    
    // MARK: - Dependencies
    private let getMovieUseCase: UseCaseMovieProtocol
    
    // MARK: - Initializer
    init(getMovieUseCase: UseCaseMovieProtocol = UseCaseMovie()) {
        self.getMovieUseCase = getMovieUseCase
        MovieCategory.allCases.forEach { categoryStates[$0] = MovieCategoryState() }
    }
    
    // MARK: - Public Methods
    func fetchAllCategories() {
        MovieCategory.allCases.forEach { fetchMovie(category: $0) }
    }
    
    func fetchMovie(category: MovieCategory) {
        guard let state = categoryStates[category],
              !state.isLoading else { return }
        
        categoryStates[category]?.isLoading = true
        
        Task { @MainActor in
            defer { categoryStates[category]?.isLoading = false }
            
            do {
                let response = try await getMovieUseCase.getArrayMovies(category: category, page: 1)
                categoryStates[category]?.movies = response
                
            } catch let error as GenericError {
                errorMessage = "Código: \(error.codigo), Mensaje: \(error.mensaje)"
                showErrorAlert = true
            }
        }
    }
}
