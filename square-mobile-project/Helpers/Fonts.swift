//
//  Fonts.swift
//  square-mobile-project
//
//  Created by Michael Duong on 8/13/20.
//

import UIKit

extension UIFont {
    
    // Employee name font
    public static var name: UIFont = UIFont(name: .helveticaBold, size: 20)!
    // Employee team font
    public static var team: UIFont = UIFont(name: .helveticaOblique, size: 14)!
    // Employee email address & phone number font
    public static var info: UIFont = UIFont(name: .helveticaRegular, size: 12)!
}

// MARK: - Font names
extension String {
    
    fileprivate static let helveticaBold: String = "Helvetica-Bold"
    fileprivate static let helveticaOblique: String = "Helvetica-Oblique"
    fileprivate static let helveticaRegular: String = "Helvetica"
}
