//
//  URL+Extenstions.swift
//  BankApp
//
//  Created by Fillipi Paiva Suszek on 21/12/20.
//

import Foundation

extension URL {
    static func urlForAccounts() -> URL? {
        return URL(string: "https://raspy-fossil-basilisk.glitch.me/api/accounts")
    }

    static func urlForCreateAccounts() -> URL? {
        return URL(string: "https://raspy-fossil-basilisk.glitch.me/api/accounts")
    }
}
