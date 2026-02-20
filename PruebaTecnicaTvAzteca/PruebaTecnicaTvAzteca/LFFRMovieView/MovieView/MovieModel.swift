//
//  ListMovieModel.swift
//  PruebaTecnicaTvAzteca
//
//  Created by Fernando Flores on 18/02/26.
//

import Foundation

// MARK: - MoviesModel
struct MoviesModel: Codable {
    
    // MARK: - Properties
    let page: Int
    let results: [MovieResult]?
    let totalPages: Int?
    let totalResults: Int?
    
    // MARK: - Coding Keys
    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - MovieResult
struct MovieResult: Codable, Identifiable {
    
    // MARK: - Properties
    let adult: Bool
    let backdropPath: String?
    let genreIDS: [Int]
    let id: Int
    let originalLanguage, originalTitle: String
    let overview: String?
    let popularity: Double?
    let posterPath: String?
    let releaseDate, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    
    // MARK: - Coding Keys
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

// MARK: - MovieVideosResponse
struct MovieVideosResponse: Codable {
    
    // MARK: - Properties
    let results: [MovieVideo]
}

// MARK: - MovieVideo
struct MovieVideo: Codable {
    
    // MARK: - Properties
    let key: String
    let site: String
    let type: String
}

// MARK: - MovieCategoryState
struct MovieCategoryState: Codable {
    
    // MARK: - Properties
    var movies: [MovieResult] = []
    var isLoading: Bool = false
}
