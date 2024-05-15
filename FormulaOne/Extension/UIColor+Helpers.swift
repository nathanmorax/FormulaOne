//
//  UIColor+Helpers.swift
//  FormulaOne
//
//  Created by Nathan Mora on 30/04/24.
//

import UIKit

extension UIColor {
   
   private static var grayRetroColor: UIColor {
      UIColor(red: 0.35, green: 0.35, blue: 0.35, alpha: 1.00)
   }
   
   private static var tabBarRetro: UIColor {
      UIColor(red: 0.04, green: 0.05, blue: 0.07, alpha: 1.00)
   }
   
   private static var redRetroColor: UIColor {
      UIColor(red: 0.17, green: 0.35, blue: 0.31, alpha: 1.00)
   }
   
   private static var yellowRetroColor: UIColor {
      UIColor(red: 0.94, green: 0.46, blue: 0.10, alpha: 1.00)
   }
   
   private static var grayRetroColorClear: UIColor {
      UIColor(red: 0.71, green: 0.71, blue: 0.71, alpha: 1.00)
   }
   private static var greenRetroColor: UIColor {
      UIColor(red: 0.07, green: 0.37, blue: 0.31, alpha: 1.00)
   }
   
   
   enum Style {
      case grayRetroColor
      case tabBarRetro
      case redRetroColor
      case yellowRetroColor
      case grayRetroColorClear
      case greenRetroColor
   }
   
   static func custom(style: Style) -> UIColor {
      
      switch style {
      case .grayRetroColor: return grayRetroColor
      case .tabBarRetro: return tabBarRetro
      case .redRetroColor: return redRetroColor
      case .yellowRetroColor: return yellowRetroColor
      case .grayRetroColorClear: return grayRetroColorClear
      case .greenRetroColor: return greenRetroColor
      }
   }
}


extension UIColor {
    static var dynamicText: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { (traitCollection: UITraitCollection) -> UIColor in
               return traitCollection.userInterfaceStyle == .dark ? .white : .black
            }
        } else {
            return .black
        }
    }
}

