//
//  Double+Extensions.swift
//  BankApp
//
//  Created by Fillipi Paiva Suszek on 21/12/20.
//

import Foundation

extension Double {
    func formarAsCurrency() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        let formattedCurrency = formatter.string(from: self as NSNumber)
        return formattedCurrency ?? ""
    }
}
