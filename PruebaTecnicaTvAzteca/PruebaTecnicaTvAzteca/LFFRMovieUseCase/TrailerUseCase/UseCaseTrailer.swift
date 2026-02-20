//
//  UseCaseTrailer.swift
//  PruebaTecnicaTvAzteca
//
//  Created by Fernando Flores on 19/02/26.
//

// MARK: - UseCaseTrailer
internal final class UseCaseTrailer: UseCaseTrailerProtocol {
    
    // MARK: - Properties
    private let trailerRepository: TrailerRepositoryProtocol
    
    // MARK: - Initializer
    init(trailerRepository: TrailerRepositoryProtocol = TrailerRepository()) {
        self.trailerRepository = trailerRepository
    }
    
    // MARK: - Methods
    func getMovieTrailer(movieId: Int) async throws -> [MovieVideo] {
        
        let response = try await trailerRepository.getMovieTrailer(movieId: movieId)
        
        return response.results
    }
}
