//
//  UIFont+Custom.swift
//  FormulaOne
//
//  Created by Xcaret Mora on 29/03/24.
//

import UIKit

extension UIFont {
   
   static func customFontSubtitle(ofSize fontSize: CGFloat) -> UIFont? {
      return UIFont(name: "C&CRedAlertINET", size: fontSize)
   }
   
   static func customFontTitle(ofSize fontSize: CGFloat) -> UIFont? {
      return UIFont(name: "Superstcrea", size: fontSize)
   }
   
}

extension NSAttributedString {
    static func setTextBold(_ text: String, fontSize: CGFloat) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: text)
        
        if let customFont = UIFont.customFontTitle(ofSize: fontSize) {
            attributedString.addAttribute(.font, value: customFont, range: NSRange(location: 0, length: attributedString.length))
        }
        
        return attributedString
    }
}
