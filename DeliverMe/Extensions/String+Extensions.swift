//
//  String+Extensions.swift
//  DeliverMe
//
//  Created by Pubudu Mihiranga on 2024-08-30.
//

import Foundation

extension String {
    
    // use to load strings from localization file
    func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
    
    // remove `$` prefix from given string
    func removeDollarSign() -> String {
        if self.hasPrefix("$") {
            return String(self.dropFirst())
        }
        return self
    }
}
