//
//  HelpersTest.swift
//  DeliverMeTests
//
//  Created by Pubudu Mihiranga on 2024-08-31.
//

import XCTest
@testable import DeliverMe

final class HelpersTest: XCTestCase {

    func testCalculateTotalDeliveryFee_ValidInputs() {
        let deliveryFee = "$10.00"
        let surcharge = "$5.50"
        let expected = "$15.50"
        
        let result = Helpers.calculateTotalDeliveryFee(deliveryFee: deliveryFee, surcharge: surcharge)
        
        XCTAssertEqual(result, expected)
    }
}
