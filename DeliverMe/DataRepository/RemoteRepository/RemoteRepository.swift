//
//  RemoteRepository.swift
//  DeliverMe
//
//  Created by Pubudu Mihiranga on 2024-08-30.
//

import Foundation

final class RemoteRepository: DataStoreProtocol {
    
    let networkStore: NetworkStoreProtocol
    
    init(networkStore: NetworkStoreProtocol = NetworkStore()) {
        self.networkStore = networkStore
    }
    
    func getDeliveries(offset: Int) async throws -> [Delivery] {
        let deliveries = try await networkStore.sendRequest(endpoint: DeliveriesRequest.allDeliveries(offSet: offset),
                                                            responseModel: [Delivery].self)
        return deliveries
    }
}
