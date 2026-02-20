//
//  TrailerRepository.swift
//  PruebaTecnicaTvAzteca
//
//  Created by Fernando Flores on 19/02/26.
//

// MARK: - TrailerRepository
internal final class TrailerRepository: TrailerRepositoryProtocol {
    
    // MARK: - Methods
    func getMovieTrailer(movieId: Int) async throws -> MovieVideosResponse {
        
        // MARK: - URL Setup
        let baseURL = Constant.apiURL + "movie/\(movieId)/videos"
        let queryItems = [
            "api_key": Constant.apiKey,
            "language": "es-MX"
        ]
        
        // MARK: - API Request
        return try await ApiManager.shared.request(
            baseUrl: baseURL,
            method: .get,
            queryItems: queryItems,
            responseType: MovieVideosResponse.self
        )
    }
}
