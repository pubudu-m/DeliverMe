//
//  AppError.swift
//  DeliverMe
//
//  Created by Pubudu Mihiranga on 2024-09-01.
//

import Foundation

enum AppError: Error {
    case badURL
    case badResponse
    case parsing
    case unexpectedStatusCode(code: Int)
    case cachingError
    case unknown
}

extension AppError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .badURL:
            return NSLocalizedString("The URL provided was invalid.", comment: "Invalid URL Error")
        case .badResponse:
            return NSLocalizedString("The server response was invalid.", comment: "Invalid Response Error")
        case .parsing:
            return NSLocalizedString("There was an error parsing the data.", comment: "Parsing Error")
        case .unexpectedStatusCode(_):
            return NSLocalizedString("The server response status code was invalid.", comment: "Invalid Status Code Error")
        case .cachingError:
            return NSLocalizedString("There was an error when accessing your cache data.", comment: "Cache Error")
        case .unknown:
            return NSLocalizedString("An unknown error occurred.", comment: "Unknown Error")
        }
    }
}
