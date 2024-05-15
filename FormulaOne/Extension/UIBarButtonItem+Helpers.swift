//
//  UIBarButtonItem+Helpers.swift
//  FormulaOne
//
//  Created by Nathan Mora on 05/05/24.
//

import UIKit

extension UIBarButtonItem {
   
   static let customFontName = "Superstcrea"
   
   func setCustomFont(size: CGFloat) {
      if let customFont = UIFont(name: UIBarButtonItem.customFontName, size: size) {
         let attributes: [NSAttributedString.Key: Any] = [
            .font: customFont,
            .foregroundColor: UIColor.custom(style: .greenRetroColor)
         ]
         self.setTitleTextAttributes(attributes, for: .normal)
      } else {
         print("Error: No se pudo cargar la fuente personalizada.")
      }
   }
   
}
