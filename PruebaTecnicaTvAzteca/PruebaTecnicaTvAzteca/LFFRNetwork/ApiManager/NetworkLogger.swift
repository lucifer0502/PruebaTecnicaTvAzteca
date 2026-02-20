//
//  NetworkLogger.swift
//  PruebaTecnicaTvAzteca
//
//  Created by Fernando Flores 19/02/26.
//

import Foundation

class NetworkLogger{
    
    func logNetworkRequest(url: URL, method: HttpMethod, headers: [String: String], queryItems: [String: String]?, body: Encodable?) {
        print("\n📡 ====== REQUEST ======")
        print("➡️ URL: \(url.absoluteString)")
        print("🧭 Método: \(method.rawValue)")
        
        if let queryItems = queryItems, !queryItems.isEmpty {
            print("🔎 QueryItems:")
            queryItems.forEach { print("   • \($0.key): \($0.value)") }
        }
        if !headers.isEmpty {
            print("🧾 Headers:")
            headers.forEach { print("   • \($0.key): \($0.value)") }
        }
        if let body = body, let data = try? JSONEncoder().encode(body),
           let jsonString = String(data: data, encoding: .utf8) {
            print("📦 Request Body:\n\(jsonString)")
        } else {
            print("📦 Request Body: vacío")
        }
        print("========================\n")
    }
    
    func logNetworkResponse(url: URL, response: HTTPURLResponse, data: Data) {
        print("\n📥 ====== RESPONSE ======")
        print("⬅️ URL: \(url.absoluteString)")
        print("📶 Status Code: \(response.statusCode)")
        
        if let jsonString = String(data: data, encoding: .utf8), !jsonString.isEmpty {
            print("📦 Response Body:\n\(jsonString)")
        } else {
            print("📦 Response Body: vacío")
        }
        print("========================\n")
    }
}
