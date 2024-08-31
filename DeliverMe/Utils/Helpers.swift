//
//  Helpers.swift
//  DeliverMe
//
//  Created by Pubudu Mihiranga on 2024-08-30.
//

import Foundation

struct Helpers {
    
    // calculate total using given 2 strings and return the total as a String
    static func calculateTotalDeliveryFee(deliveryFee: String, surcharge: String) -> String {
        guard let deliveryFee = Double(deliveryFee.removeDollarSign()),
              let surcharge = Double(surcharge.removeDollarSign()) else { return "" }
        let total = deliveryFee + surcharge
        return String(format: "$%.2f", total)
    }
}
