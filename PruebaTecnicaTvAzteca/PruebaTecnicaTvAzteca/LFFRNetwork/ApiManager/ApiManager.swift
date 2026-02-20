//
//  ApiManager.swift
//  PruebaTecnicaTvAzteca
//
//  Created by Fernando Flores on 17/02/26.
//

import Foundation

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

final class ApiManager {
    
    static let shared = ApiManager()
    private init() {}
    private let logger = NetworkLogger()
    
    func request<T: Codable>(
        baseUrl: String,
        method: HttpMethod,
        queryItems: [String: String]? = nil,
        headers: [String: String] = [:],
        requestBody: Encodable? = nil,
        responseType: T.Type
    ) async throws -> T {
        
        guard var url = URL(string: baseUrl) else {
            throw GenericError(codigo: "Error-400", mensaje: "URL inválida")
        }
        
        if let queryItems = queryItems {
            guard var components = URLComponents(string: baseUrl) else {
                throw GenericError(codigo: "Error-400", mensaje: "URL inválida")
            }
            components.queryItems = queryItems.map { URLQueryItem(name: $0.key, value: $0.value) }
            
            guard let finalURL = components.url else {
                throw GenericError(codigo: "Error-401", mensaje: "Error al construir la URL con parámetros")
            }
            url = finalURL
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        headers.forEach { key, value in
            urlRequest.setValue(value, forHTTPHeaderField: key)
        }
        
        if let requestBody = requestBody {
            urlRequest.httpBody = try JSONEncoder().encode(requestBody)
        }
        
       
        logger.logNetworkRequest(url: url, method: method, headers: headers, queryItems: queryItems, body: requestBody)
        
        do {
           
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw GenericError(codigo: "Error-410", mensaje: "Respuesta inválida del servidor")
            }
            
           
            logger.logNetworkResponse(url: url, response: httpResponse, data: data)
            
            guard 200..<300 ~= httpResponse.statusCode else {
                throw GenericError(codigo: "\(httpResponse.statusCode)", mensaje: "Error 400-500")
            }
            
            do {
                return try JSONDecoder().decode(T.self, from: data)
            } catch {
                throw GenericError(codigo: "Error-403", mensaje: "Error al decodificar el JSON")
            }
            
        } catch let error as GenericError {
            throw error 
        } catch {
            throw GenericError(codigo: "unknown", mensaje: error.localizedDescription)
        }

    }
}
