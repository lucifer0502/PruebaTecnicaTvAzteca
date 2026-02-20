//
//  UseCaseTrailerProtocol.swift
//  PruebaTecnicaTvAzteca
//
//  Created by Fernando Flores on 19/02/26.
//

import Foundation

// MARK: - UseCaseTrailerProtocol
internal protocol UseCaseTrailerProtocol {
    
    // MARK: - Methods
    func getMovieTrailer(movieId: Int) async throws -> [MovieVideo]
}
