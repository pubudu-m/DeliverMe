//
//  CacheDataRepository.swift
//  DeliverMe
//
//  Created by Pubudu Mihiranga on 2024-08-30.
//

import Foundation
import CoreData

final class CacheDataRepository: DataStoreProtocol, CachingProtocol {
    
    // initialize core persistent container
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "DeliverMeCacheDataModel")
        container.loadPersistentStores(completionHandler: { (description, error) in
            if error != nil {
                fatalError("Error initializing Core Data")
            }
        })
        
        return container
    }()
    
    // add new data to cache/core data
    func addDeliveries(deliveries: [Delivery]) async throws {
        let context = persistentContainer.viewContext
        
        deliveries.forEach { delivery in
            let newData = DeliveryEntity(context: context)
            newData.deliveryId = UUID().uuidString
            newData.remarks = delivery.remarks
            newData.pickupTime = delivery.pickupTime
            newData.goodsPicture = delivery.goodsPicture
            newData.deliveryFee = delivery.deliveryFee
            newData.surchargeFee = delivery.surcharge
            newData.routeStart = delivery.route.start
            newData.routeDestination = delivery.route.end
            newData.senderName = delivery.sender.name
            newData.senderEmail = delivery.sender.email
            newData.senderPhone = delivery.sender.phone
            newData.isFavorite = false
        }
        
        try saveContext()
    }
    
    // retrive data from cache/core data
    func getDeliveries(offset: Int) async throws -> [Delivery] {
        let context = persistentContainer.viewContext
        let request: NSFetchRequest<DeliveryEntity> = DeliveryEntity.fetchRequest()
        request.fetchLimit = 20
        request.fetchOffset = offset
        
        let deliveryEntities = try context.fetch(request)
        
        let deliveries: [Delivery] = deliveryEntities.compactMap { entity in
            return convertToDelivery(from: entity)
        }
        
        return deliveries
    }
    
    // retrive stored data count in cache/core data
    func getSavedDeliveriesCount() async throws -> Int {
        let context = persistentContainer.viewContext
        let request: NSFetchRequest<DeliveryEntity> = DeliveryEntity.fetchRequest()
        let count = try context.count(for: request)
        
        return count
    }
    
    // update isFavorite status for given deliveryId
    func updateDelivery(for deliveryId: String) async throws -> Delivery? {
        let context = persistentContainer.viewContext
        let request: NSFetchRequest<DeliveryEntity> = DeliveryEntity.fetchRequest()
        request.predicate = NSPredicate(format: "deliveryId == %@", deliveryId)
        
        let deliveryEntities = try context.fetch(request)
        guard let entity = deliveryEntities.first else {
            return nil
        }
        entity.isFavorite = !entity.isFavorite
        
        try saveContext()
        
        return convertToDelivery(from: entity)
    }
    
    private func saveContext() throws {
        let context = persistentContainer.viewContext
        
        if context.hasChanges {
            try context.save()
        }
    }
    
    // helper function to convert core data DeliveryEntity to Delivery structure
    private func convertToDelivery(from entity: DeliveryEntity) -> Delivery? {
        guard let deliveryId = entity.deliveryId,
              let remarks = entity.remarks,
              let pickupTime = entity.pickupTime,
              let goodsPicture = entity.goodsPicture,
              let deliveryFee = entity.deliveryFee,
              let surcharge = entity.surchargeFee,
              let routeStart = entity.routeStart,
              let routeDestination = entity.routeDestination,
              let senderName = entity.senderName,
              let senderEmail = entity.senderEmail,
              let senderPhone = entity.senderPhone else { return nil }
        
        return Delivery(id: deliveryId,
                        remarks: remarks,
                        pickupTime: pickupTime,
                        goodsPicture: goodsPicture,
                        deliveryFee: deliveryFee,
                        surcharge: surcharge,
                        route: DeliveryRoute(start: routeStart, end: routeDestination),
                        sender: DeliverySender(name: senderName, phone: senderPhone, email: senderEmail),
                        isFavourite: entity.isFavorite)
    }
}
