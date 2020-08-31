//
//  String+Extension.swift
//  square-mobile-project
//
//  Created by Michael Duong on 8/18/20.
//

import Foundation

extension String {
    public func toPhoneNumber() -> String {
        return self.replacingOccurrences(of: "(\\d{3})(\\d{3})(\\d+)", with: "($1) $2-$3", options: .regularExpression, range: nil)
    }
}
