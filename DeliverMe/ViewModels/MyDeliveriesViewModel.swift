//
//  MyDeliveriesViewModel.swift
//  DeliverMe
//
//  Created by Pubudu Mihiranga on 2024-08-30.
//

import Foundation

class MyDeliveriesViewModel {
    
    let remoteRepository: RemoteRepository
    let cacheRepository: CacheDataRepository
    
    var deliveries: [Delivery] = []
    
    init() {
        self.remoteRepository = RemoteRepository()
        self.cacheRepository = CacheDataRepository()
    }
    
    func getDeliveries(requestDataCount: Int) async throws {
        let cachedDataCount = try await cacheRepository.getSavedDeliveriesCount()
        let offSet = deliveries.count
        
        if cachedDataCount < requestDataCount {
            let newData = try await remoteRepository.getDeliveries(offset: offSet)
            try await cacheRepository.addDeliveries(deliveries: newData)
        }
        
        let cachedData = try await cacheRepository.getDeliveries(offset: offSet)
        deliveries.append(contentsOf: cachedData)
    }
}
