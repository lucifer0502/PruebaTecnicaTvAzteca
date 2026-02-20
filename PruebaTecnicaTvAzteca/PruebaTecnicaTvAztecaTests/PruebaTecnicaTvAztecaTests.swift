//
//  PruebaTecnicaTvAztecaTests.swift
//  PruebaTecnicaTvAztecaTests
//
//  Created by Fernando Flores on 20/02/26.
//

import XCTest
@testable import PruebaTecnicaTvAzteca

// MARK: - MovieRepositoryTests
final class MovieRepositoryTests: XCTestCase {
    
    // MARK: - Properties
    let repository: MovieRepositoryProtocol = MovieRepository()
    
    // MARK: - Popular Movies Tests
    func testGetMoviesPopular() async throws {
        do {
            let result = try await repository.getMovies(category: .popular, page: 1)
            let count = result.results?.count ?? 0
            
            XCTAssertGreaterThan(count, 0, "Se esperaban películas populares")
            print("Test popular - Primera película: \(result.results?.first?.title ?? "Desconocido")")
            print("Total películas: \(count)")
        } catch {
            XCTFail("Error al obtener películas populares: \(error)")
        }
    }
    
    // MARK: - Top Rated Movies Tests
    func testGetMoviesTopRated() async throws {
        do {
            let result = try await repository.getMovies(category: .topRated, page: 1)
            let count = result.results?.count ?? 0
            
            XCTAssertGreaterThan(count, 0, "Se esperaban películas mejor valoradas")
            print("Test top rated - Primera película: \(result.results?.first?.title ?? "Desconocido")")
        } catch {
            XCTFail("Error al obtener películas top rated: \(error)")
        }
    }
    
    // MARK: - Now Playing Movies Tests
    func testGetMoviesNowPlaying() async throws {
        do {
            let result = try await repository.getMovies(category: .nowplaying, page: 1)
            let count = result.results?.count ?? 0
            
            XCTAssertGreaterThan(count, 0, "Se esperaban películas en cartelera")
            print("Test now playing - Primera película: \(result.results?.first?.title ?? "Desconocido")")
        } catch {
            XCTFail("Error al obtener películas now playing: \(error)")
        }
    }
}

// MARK: - TrailerRepositoryTests
final class TrailerRepositoryTests: XCTestCase {
    
    // MARK: - Properties
    let repository: TrailerRepositoryProtocol = TrailerRepository()
    
    // MARK: - Invalid Movie ID Tests
    func testGetMovieTrailerInvalidId() async throws {
        do {
            let result = try await repository.getMovieTrailer(movieId: 999999999)
            
            XCTAssertEqual(result.results.count, 0, "No debería haber videos para un ID inválido")
            print("Test ID inválido - Total videos: \(result.results.count)")
        } catch {
            print("Test ID inválido - Error esperado: \(error)")
        }
    }
}
