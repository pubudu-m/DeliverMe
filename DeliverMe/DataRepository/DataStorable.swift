//
//  DataStoreProtocol.swift
//  DeliverMe
//
//  Created by Pubudu Mihiranga on 2024-08-30.
//

import Foundation

protocol DataStorable {
    func getDeliveries(offset: Int) async throws -> [Delivery]
}

protocol Cachable {
    func addDeliveries(deliveries: [Delivery]) async throws
    func updateDelivery(for deliveryId: String) async throws -> Delivery?
    func getSavedDeliveriesCount() async throws -> Int
}
