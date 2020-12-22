//
//  Account.swift
//  BankApp
//
//  Created by Fillipi Paiva Suszek on 21/12/20.
//

import Foundation

enum AccountType: String, Decodable, CaseIterable {
    case checking
    case saving
}

extension AccountType {
    var title: String {
        switch self {
        case .checking:
            return "Checking"
        case .saving:
            return "Saving"
        }
    }
}

struct Account: Decodable {
    var id: UUID
    var name: String
    let accountType: AccountType
    var balance: Double
}
