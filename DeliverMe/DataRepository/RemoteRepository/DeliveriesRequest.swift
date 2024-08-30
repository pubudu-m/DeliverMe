//
//  DeliveriesRequest.swift
//  DeliverMe
//
//  Created by Pubudu Mihiranga on 2024-08-30.
//

import Foundation

enum DeliveriesRequest {
    case allDeliveries
}

extension DeliveriesRequest: NetworkRequest {
    var path: String {
        switch self {
        case .allDeliveries:
            return "/6ede1e71eb0ad8360927"
        }
    }
    
    var method: NetworkRequestType {
        switch self {
        case .allDeliveries:
            return .get
        }
    }
}
