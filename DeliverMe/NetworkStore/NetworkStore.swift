//
//  NetworkStore.swift
//  DeliverMe
//
//  Created by Pubudu Mihiranga on 2024-08-30.
//

import Foundation

protocol NetworkStorable {
    func sendRequest<T: Decodable>(endpoint: NetworkRequest, responseModel: T.Type) async throws -> T
}

class NetworkStore: NetworkStorable {
    
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
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let response = response as? HTTPURLResponse else {
                throw AppError.badResponse
            }
            
            switch response.statusCode {
            case 200:
                guard let decodedResponse = try? JSONDecoder().decode(responseModel, from: data) else {
                    throw AppError.parsing
                }
                return decodedResponse
            default:
                throw AppError.unexpectedStatusCode(code: response.statusCode)
            }
        } catch {
            throw AppError.unknown
        }
    }
}
