//
//  UIView+Helpers.swift
//  FormulaOne
//
//  Created by Xcaret Mora on 29/03/24.
//

import Foundation

import UIKit

extension UIView {
   func addSubviews(_ views: UIView...) {
      views.forEach { view in addSubview(view) }
   }
}
