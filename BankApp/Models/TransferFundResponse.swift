//
//  TransferFundResponse.swift
//  BankApp
//
//  Created by Fillipi Paiva Suszek on 25/12/20.
//

import Foundation

struct TransferFundResponse: Decodable {
    let success: Bool
    let error: String?
}
