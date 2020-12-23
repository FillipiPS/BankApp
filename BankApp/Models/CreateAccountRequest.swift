//
//  CreateAccountRequest.swift
//  BankApp
//
//  Created by Fillipi Paiva Suszek on 22/12/20.
//

import Foundation

struct CreateAccountRequest: Encodable {
    let name: String
    let accountType: String
    let balance: Double
}
