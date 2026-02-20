//
//  UseCaseMovieProtocol.swift
//  PruebaTecnicaTvAzteca
//
//  Created by Fernando Flores on 18/02/26.
//

import Foundation

// MARK: - UseCaseMovieProtocol
protocol UseCaseMovieProtocol {
    
    // MARK: - Methods
    func getArrayMovies(category: MovieCategory, page: Int) async throws -> [MovieResult]
}
