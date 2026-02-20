//
//  TrailerViewModel.swift
//  PruebaTecnicaTvAzteca
//
//  Created by Fernando Flores on 19/02/26.
//

import Foundation

@MainActor
final class MovieDetailViewModel: ObservableObject {
    
    // MARK: - Published Properties
    @Published var isLoading: Bool = false
    @Published var showErrorAlert: Bool = false
    @Published var errorMessage: String = ""
    @Published var showTrailer: Bool = false
    var movieKey: String?
    
    // MARK: - Dependencies
    private let useCaseTrailer: UseCaseTrailerProtocol
    
    // MARK: - Initializer
    init(useCaseTrailer: UseCaseTrailerProtocol = UseCaseTrailer()) {
        self.useCaseTrailer = useCaseTrailer
    }
    
    // MARK: - Public Methods
    func fetchVideos(movieId: Int) {
        isLoading = true
        Task {
            defer { isLoading = false }
            do {
                let response = try await useCaseTrailer.getMovieTrailer(movieId: movieId)
                trailerKey(response)
                showTrailer = true
            } catch let error as GenericError {
                errorMessage = "Código: \(error.codigo), Mensaje: \(error.mensaje)"
                showErrorAlert = true
            }
        }
    }
    
    // MARK: - Private Methods
    private func trailerKey(_ movies: [MovieVideo]) {
        let selectedMovie = movies.first(where: { $0.type == "Trailer" }) ?? movies.first
        movieKey = selectedMovie?.key
    }
}
