//
//  TransferAccountFund.swift
//  BankApp
//
//  Created by Fillipi Paiva Suszek on 25/12/20.
//

import Foundation

struct TransferFundRequest: Encodable {
    let accountFromId: String
    let accountToId: String
    let amount: Double
}
