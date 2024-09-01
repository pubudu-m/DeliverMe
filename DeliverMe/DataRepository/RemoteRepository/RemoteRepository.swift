//
//  RemoteRepository.swift
//  DeliverMe
//
//  Created by Pubudu Mihiranga on 2024-08-30.
//

import Foundation

final class RemoteRepository: DataStorable {
    
    private let networkStore: NetworkStorable
    
    init(networkStore: NetworkStorable = NetworkStore()) {
        self.networkStore = networkStore
    }
    
    func getDeliveries(offset: Int) async throws -> [Delivery] {
        let deliveries = try await networkStore.sendRequest(endpoint: DeliveriesRequest.allDeliveries(offSet: offset),
                                                            responseModel: [Delivery].self)
        return deliveries
    }
}
