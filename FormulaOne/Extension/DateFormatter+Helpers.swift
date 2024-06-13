//
//  DateFormatter+Helpers.swift
//  FormulaOne
//
//  Created by Xcaret Mora on 29/03/24.
//

import Foundation

extension String {
    func convertDateFormat(inputDate: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        guard let date = dateFormatter.date(from: inputDate) else { return nil }

        dateFormatter.dateFormat = "dd MMM yyyy, HH:mm" 
        return dateFormatter.string(from: date)
    }
}
