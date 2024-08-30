//
//  Delivery.swift
//  DeliverMe
//
//  Created by Pubudu Mihiranga on 2024-08-30.
//

import Foundation

struct Delivery: Codable {
    let id: String
    let remarks: String
    let pickupTime: String
    let goodsPicture: String
    let deliveryFee: String
    let surcharge: String
    let route: DeliveryRoute
    let sender: DeliverySender
    let isFavourite: Bool?
}

struct DeliveryRoute: Codable {
    let start: String
    let end: String
}

struct DeliverySender: Codable {
    let name: String
    let phone: String
    let email: String
}
