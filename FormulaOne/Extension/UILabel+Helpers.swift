//
//  UILabel+Helpers.swift
//  FormulaOne
//
//  Created by Nathan Mora on 02/05/24.
//

import UIKit

extension UILabel {
    func applyShadow(color: UIColor = .black, offset: CGSize = CGSize(width: 2, height: 2), opacity: Float = 1, radius: CGFloat = 9) {
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
        layer.masksToBounds = false
    }
    
    func applyRetroStyle(fontName: String = "C&CRedAlertINET", fontSize: CGFloat = 14, textColor: UIColor = .white, textAlignment: NSTextAlignment = .center, borderColor: UIColor = .black, borderWidth: CGFloat = 1, cornerRadius: CGFloat = 9) {
        font = UIFont(name: fontName, size: fontSize)
        self.textColor = textColor
        self.textAlignment = textAlignment
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
    }
}
