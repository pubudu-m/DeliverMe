//
//  DataStore.swift
//  DeliverMe
//
//  Created by Pubudu Mihiranga on 2024-08-30.
//

import Foundation

final class DataStore {
    static let shared = DataStore()
    
    private let remoteRepository: DataStoreProtocol
    private let cacheRepository: DataStoreProtocol & CachingProtocol
    
    private(set) var deliveries: [Delivery] = []
    
    private init(remoteRepository: DataStoreProtocol = RemoteRepository(),
                 cacheRepository: DataStoreProtocol & CachingProtocol = CacheDataRepository()) {
        self.remoteRepository = remoteRepository
        self.cacheRepository = cacheRepository
    }
    
    func getDeliveries(requestDataCount: Int) async throws {
        let cachedDataCount = try await cacheRepository.getSavedDeliveriesCount()
        let offSet = deliveries.count
        
        // if cachedDataCount is less than requestDataCount then fetch new data from remote repository and update the cache
        if cachedDataCount < requestDataCount {
            let newData = try await remoteRepository.getDeliveries(offset: offSet)
            try await cacheRepository.addDeliveries(deliveries: newData)
        }
        
        let cachedData = try await cacheRepository.getDeliveries(offset: offSet)
        deliveries.append(contentsOf: cachedData)
    }
    
    func updateFavouriteStatus(for deliveryId: String) async throws {
        // Update cache data
        let updatedDelivery = try await cacheRepository.updateDelivery(for: deliveryId)
        
        // Update in-memory data
        if let updatedDelivery = updatedDelivery, let index = deliveries.firstIndex(where: { $0.id == deliveryId }) {
            deliveries[index] = updatedDelivery
        }
    }
}
