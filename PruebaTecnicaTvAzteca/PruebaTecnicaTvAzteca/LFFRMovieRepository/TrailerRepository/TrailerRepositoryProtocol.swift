//
//  TrailerRepositoryProtocol.swift
//  PruebaTecnicaTvAzteca
//
//  Created by Fernando Flores on 19/02/26.
//

// MARK: - TrailerRepositoryProtocol
internal protocol TrailerRepositoryProtocol {
    
    // MARK: - Methods
    func getMovieTrailer(movieId: Int) async throws -> MovieVideosResponse
}
