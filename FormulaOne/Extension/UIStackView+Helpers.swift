//
//  UIStackView+Helpers.swift
//  FormulaOne
//
//  Created by Xcaret Mora on 29/03/24.
//

import UIKit

extension UIStackView {
   func addArrangedSubviews(_ views: UIView...) {
      views.forEach { view in addArrangedSubview(view) }
   }
}
