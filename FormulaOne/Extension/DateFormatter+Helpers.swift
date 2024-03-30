//
//  DateFormatter+Helpers.swift
//  FormulaOne
//
//  Created by Xcaret Mora on 29/03/24.
//

import Foundation

extension String {
    func convertDateFormat(inputDate: String) -> String {
        
        let olDateFormatter = DateFormatter()
        olDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        let oldDate = olDateFormatter.date(from: inputDate) ?? Date()
        
        let convertDateFormatter = DateFormatter()
        convertDateFormatter.dateFormat = "MMM d, h:mm a"
        
        return convertDateFormatter.string(from: oldDate)
    }
}
