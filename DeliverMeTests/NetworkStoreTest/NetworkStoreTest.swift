//
//  NetworkStoreTest.swift
//  DeliverMeTests
//
//  Created by Pubudu Mihiranga on 2024-08-31.
//

import XCTest
@testable import DeliverMe

final class NetworkStoreTest: XCTestCase {
    
    var networkStore: MockNetworkStore!
    
    override func setUp() {
        super.setUp()
        networkStore = MockNetworkStore()
    }

    override func tearDown() {
        networkStore = nil
        super.tearDown()
    }

    func testSendRequestReturnsCorrectResponse() {
        Task {
            do {
                let response: [Delivery] = try await networkStore.sendRequest(endpoint: MockRequest.allDeliveries, responseModel: [Delivery].self)
                XCTAssertEqual(response.count, 20)
            } catch {
                XCTFail("Failed with error: \(error.localizedDescription)")
            }
        }
    }
}
