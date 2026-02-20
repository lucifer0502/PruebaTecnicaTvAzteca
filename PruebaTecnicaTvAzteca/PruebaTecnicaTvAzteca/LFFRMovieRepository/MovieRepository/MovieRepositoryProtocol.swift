//
//  MovieRepositoryProtocol.swift
//  PruebaTecnicaTvAzteca
//
//  Created by Fernando Flores on 18/02/26.
//

import Foundation

// MARK: - MovieRepositoryProtocol
internal protocol MovieRepositoryProtocol {
    
    // MARK: - Methods
    func getMovies(category: MovieCategory, page: Int) async throws -> MoviesModel
}
