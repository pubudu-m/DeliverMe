//
//  NetworkStore.swift
//  DeliverMe
//
//  Created by Pubudu Mihiranga on 2024-08-30.
//

import Foundation

protocol NetworkStoreProtocol {
    func sendRequest<T: Decodable>(endpoint: NetworkRequest, responseModel: T.Type) async throws -> T
}

class NetworkStore: NetworkStoreProtocol {
    
    func sendRequest<T: Decodable>(endpoint: NetworkRequest, responseModel: T.Type) async throws -> T {
        var urlComponents = URLComponents()
        urlComponents.scheme = endpoint.scheme
        urlComponents.host = endpoint.host
        urlComponents.path = endpoint.path
        
        guard let url = urlComponents.url else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        return try JSONDecoder().decode(T.self, from: data)
    }
}
