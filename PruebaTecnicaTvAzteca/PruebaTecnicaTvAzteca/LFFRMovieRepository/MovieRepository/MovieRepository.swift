//
//  MovieRepository.swift
//  PruebaTecnicaTvAzteca
//
//  Created by Fernando Flores on 18/02/26.
//

// MARK: - MovieRepository
internal final class MovieRepository: MovieRepositoryProtocol {
    
    // MARK: - Methods
    func getMovies(category: MovieCategory, page: Int) async throws -> MoviesModel {
        
        // MARK: - URL Setup
        let baseURL = Constant.apiURL + "movie/\(category.rawValue)"
        let queryItems = [
            "api_key": Constant.apiKey,
            "language": "es-MX",
            "page": "\(page)"
        ]
        
        // MARK: - API Request
        return try await ApiManager.shared.request(
            baseUrl: baseURL,
            method: .get,
            queryItems: queryItems,
            responseType: MoviesModel.self
        )
    }
}
