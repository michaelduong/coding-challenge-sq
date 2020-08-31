//
//  Colors.swift
//  square-mobile-project
//
//  Created by Michael Duong on 8/13/20.
//

import UIKit

// MARK: - Colors
extension UIColor {
    
    // Background Color
    public static var backgroundGray: UIColor = .init(hex: "#F4F4F4")
    // Text Color
    public static var label: UIColor = .init(hex: "#3C3C43", alpha: 0.6)
    // Shadow Color
    public static var shadow: UIColor = .init(hex: "#0E0E0E", alpha: 0.3)
}

// MARK: - Utility
extension UIColor {

    /// Initialize a color according to the hexadecimal string value
    /// - Parameters:
    ///     - hex: string representing the color in hexadecimal format
    ///     - alpha: alpha value of the color to be generated
    /// - Note: the hexadecimal string must be valid (including `#` and `6` hexadecimal digits
    public convenience init(hex: String, alpha: CGFloat = 1) {

        guard hex.hasPrefix("#") else { fatalError() }

        let start = hex.index(hex.startIndex, offsetBy: 1)
        let hexColor = String(hex[start...])

        guard hexColor.count == 6 else { fatalError() }

        let scanner = Scanner(string: hexColor)

        var hexNumber: UInt64 = 0

        guard scanner.scanHexInt64(&hexNumber) else { fatalError() }

        let r = CGFloat((hexNumber & 0xFF0000) >> 16) / 255
        let g = CGFloat((hexNumber & 0x00FF00) >> 8) / 255
        let b = CGFloat((hexNumber & 0x0000FF) >> 0) / 255

        self.init(displayP3Red: r, green: g, blue: b, alpha: alpha)
    }
}
