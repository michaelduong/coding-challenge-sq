//
//  UILabel+Extension.swift
//  square-mobile-project
//
//  Created by Michael Duong on 8/14/20.
//

import UIKit

extension UILabel {
    convenience public init(font: UIFont? = UIFont.systemFont(ofSize: 14), textColor: UIColor = .black, textAlignment: NSTextAlignment = .left, numberOfLines: Int = 1) {
        self.init()
        self.font = font
        self.textColor = textColor
        self.textAlignment = textAlignment
        self.numberOfLines = numberOfLines
    }
}
