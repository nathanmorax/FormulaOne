//
//  UINavigationBar+Helpers.swift
//  FormulaOne
//
//  Created by Nathan Mora on 02/05/24.
//

import UIKit

extension UIViewController {
    func setupCustomNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let largeTitleFont = UIFont(name: "Superstcrea", size: 30)
        let titleFont = UIFont(name: "Superstcrea", size: 24)
        
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.font: largeTitleFont ?? UIFont.systemFont(ofSize: 30)]
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: titleFont ?? UIFont.systemFont(ofSize: 24)]
    }
}



