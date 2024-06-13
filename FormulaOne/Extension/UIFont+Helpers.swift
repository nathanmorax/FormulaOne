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
    
    static func setTextDataBold(from date: Date?, withFontSize fontSize: CGFloat) -> NSAttributedString {
        let dateString: String
        
        if let date = date {
            let convertDateFormatter = DateFormatter()
            convertDateFormatter.dateFormat = "MMM d, h:mm a"
            dateString = convertDateFormatter.string(from: date)
        } else {
            dateString = "Des"
        }
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: fontSize)
        ]
        
        return NSAttributedString(string: dateString, attributes: attributes)
    }
    
    static func setTextBold(_ text: String, fontSize: CGFloat) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: text)
        
        if let customFont = UIFont.customFontTitle(ofSize: fontSize) {
            attributedString.addAttribute(.font, value: customFont, range: NSRange(location: 0, length: attributedString.length))
        }
        
        return attributedString
    }
    
    static func setTextGray(_ text: String, fontSize: CGFloat) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: text)
        
        if let customFont = UIFont.customFontTitle(ofSize: fontSize) {
            attributedString.addAttribute(.font, value: customFont, range: NSRange(location: 0, length: attributedString.length))
        }
        
        attributedString.addAttribute(.foregroundColor, value: UIColor.gray, range: NSRange(location: 0, length: attributedString.length))
        
        return attributedString
    }
}
