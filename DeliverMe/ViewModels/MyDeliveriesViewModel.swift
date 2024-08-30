//
//  MyDeliveriesViewModel.swift
//  DeliverMe
//
//  Created by Pubudu Mihiranga on 2024-08-30.
//

import Foundation

class MyDeliveriesViewModel {
    
    let dataStore: DataStore
    
    init() {
        self.dataStore = DataStore.shared
    }
    
    func getDeliveries() -> [Delivery] {
        return dataStore.deliveries
    }
    
    func fetchDeliveries(requestDataCount: Int) async throws {
        try await dataStore.getDeliveries(requestDataCount: requestDataCount)
    }
}
