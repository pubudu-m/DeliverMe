//
//  DeliveriesRequest.swift
//  DeliverMe
//
//  Created by Pubudu Mihiranga on 2024-08-30.
//

import Foundation

enum DeliveriesRequest {
    case allDeliveries(offSet: Int)
}

extension DeliveriesRequest: NetworkRequest {
    
    // update with new JSON bin URL path, if this is not working
    var path: String {
        switch self {
        case .allDeliveries(let offSet):
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
