//
//  MockNetworkStore.swift
//  DeliverMeTests
//
//  Created by Pubudu Mihiranga on 2024-08-31.
//

import Foundation
@testable import DeliverMe

enum MockRequest {
    case allDeliveries
}

extension MockRequest: NetworkRequest {
    var path: String {
        switch self {
        case .allDeliveries:
            return "/6ede1e71eb0ad8360927"
        }
    }
    
    var method: NetworkRequestType {
        switch self {
        case .allDeliveries:
            return .get
        }
    }
}

class MockNetworkStore: NetworkStoreProtocol {
    func sendRequest<T: Decodable>(endpoint: NetworkRequest, responseModel: T.Type) async throws -> T {
        let mockData: Data
        if let url = Bundle(for: type(of: self)).url(forResource: "my_deliveries.fixture", withExtension: "json") {
            mockData = try Data(contentsOf: url)
        } else {
            throw NSError(domain: "MockDataError", code: 1, userInfo: [NSLocalizedDescriptionKey: "Mock data file not found"])
        }
        
        let decoder = JSONDecoder()
        let response = try decoder.decode(T.self, from: mockData)
        return response
    }
}
