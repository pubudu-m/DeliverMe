//
//  String+Extensions.swift
//  DeliverMe
//
//  Created by Pubudu Mihiranga on 2024-08-30.
//

import Foundation

extension String {
    
    func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
    
    func removeDollarSign() -> String {
        if self.hasPrefix("$") {
            return String(self.dropFirst())
        }
        return self
    }
}
