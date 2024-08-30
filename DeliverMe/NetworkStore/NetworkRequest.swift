//
//  NetworkRequest.swift
//  DeliverMe
//
//  Created by Pubudu Mihiranga on 2024-08-30.
//

import Foundation

enum NetworkRequestType: String {
    case get = "GET"
}

protocol NetworkRequest {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: NetworkRequestType { get }
}

extension NetworkRequest {
    var scheme: String {
        return "https"
    }
    
    var host: String {
        return "api.npoint.io"
    }
}
