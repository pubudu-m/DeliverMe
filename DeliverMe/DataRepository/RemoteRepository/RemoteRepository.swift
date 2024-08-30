//
//  RemoteRepository.swift
//  DeliverMe
//
//  Created by Pubudu Mihiranga on 2024-08-30.
//

import Foundation

class RemoteRepository: DataStoreProtocol {
    
    let networkStore: NetworkStore
    
    init() {
        self.networkStore = NetworkStore()
    }
    
    func getDeliveries(offset: Int) async throws -> [Delivery] {
        let deliveries = try await networkStore.sendRequest(endpoint: DeliveriesRequest.allDeliveries, responseModel: [Delivery].self)
        return deliveries
    }
}
