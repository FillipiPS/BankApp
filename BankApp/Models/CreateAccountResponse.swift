//
//  CreateAccountResponse.swift
//  BankApp
//
//  Created by Fillipi Paiva Suszek on 22/12/20.
//

import Foundation

struct CreateAccountResponse: Decodable {
    let success: Bool
    let error: String?
}
