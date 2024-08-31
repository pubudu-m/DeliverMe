//
//  String+ExtensionsTest.swift
//  DeliverMeTests
//
//  Created by Pubudu Mihiranga on 2024-08-31.
//

import XCTest
@testable import DeliverMe

final class String_ExtensionsTest: XCTestCase {
    
    func testRemoveDollarSign_WithDollarSign() {
        let input = "$100"
        let expected = "100"
        
        let result = input.removeDollarSign()
        
        XCTAssertEqual(result, expected)
    }
    
    func testRemoveDollarSign_WithoutDollarSign() {
        let input = "100"
        let expected = "100"
        
        let result = input.removeDollarSign()
        
        XCTAssertEqual(result, expected)
    }
}
