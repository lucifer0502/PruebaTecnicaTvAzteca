//
//  UseCaseMovie.swift
//  PruebaTecnicaTvAzteca
//
//  Created by Fernando Flores on 18/02/26.
//

// MARK: - UseCaseMovie
internal final class UseCaseMovie: UseCaseMovieProtocol {
    
    // MARK: - Properties
    private let movieRepository: MovieRepositoryProtocol
    
    // MARK: - Initializer
    init(movieRepository: MovieRepositoryProtocol = MovieRepository()) {
        self.movieRepository = movieRepository
    }
    
    // MARK: - Methods
    func getArrayMovies(category: MovieCategory, page: Int) async throws -> [MovieResult] {
        
        let response = try await movieRepository.getMovies(category: category, page: page)
        
        guard let arrayMovie = response.results,
              let pages = response.totalPages else {
            throw GenericError(codigo: "", mensaje: "Ocurrio un error inesperado")
        }
        
        Constant.pages = pages
        
        return arrayMovie
    }
}
