//
//  UIViewCell.swift
//  FormulaOne
//
//  Created by Nathan Mora on 01/05/24.
//

import UIKit

extension UICollectionViewCell {
   
   func configureView() {
      self.layer.shadowColor = UIColor.black.cgColor
      self.layer.shadowOffset = CGSize(width: 2, height: 2) // Desplazamiento del sombreado en la dirección derecha y abajo
      self.layer.shadowOpacity = 0.7 // Opacidad de la sombra
      self.layer.shadowRadius = 6 // Radio de la sombra
      self.layer.masksToBounds = false
      
      self.contentView.layer.borderWidth = 2
      self.contentView.layer.borderColor = UIColor.black.cgColor
      self.contentView.backgroundColor = grayRetroColor
      self.contentView.layer.cornerRadius = 8
      self.contentView.layer.masksToBounds = true

   }
}
