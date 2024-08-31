//
//  DeliveryDetailsViewModel.swift
//  DeliverMe
//
//  Created by Pubudu Mihiranga on 2024-08-30.
//

import Foundation

class DeliveryDetailsViewModel: ObservableObject {
    
    @Published var delivery: Delivery
    
    let dataStore: DataStore
    
    init(dataStore: DataStore = DataStore.shared, delivery: Delivery) {
        self.dataStore = dataStore
        self.delivery = delivery
    }
    
    func updateFavouriteStatus() async throws {
        try await dataStore.updateFavouriteStatus(for: delivery.id)
    }
}
