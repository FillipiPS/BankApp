//
//  AddAccountViewModel.swift
//  BankApp
//
//  Created by Fillipi Paiva Suszek on 23/12/20.
//

import Foundation

class AddAccountViewModel: ObservableObject {
    var name: String = ""
    var accountType: AccountType = .checking
    var balance: String = ""
    @Published var errorMessage: String = ""
}

extension AddAccountViewModel {
    private var isNameValid: Bool {
        !name.isEmpty
    }
    private var isBalanceValid: Bool {
        guard let userBalance = Double(balance) else {
            return false
        }

        return userBalance <= 0 ? false : true
    }

    private func isValid() -> Bool {
        var errors = [String]()

        if !isNameValid {
            errors.append("Name is not valid")
        }
        if !isBalanceValid {
            errors.append("Balance is not valid")
        }
        if errors.isEmpty {
            self.errorMessage = errors.joined(separator: "\n")
            return false
        }

        return true
    }
}

extension AddAccountViewModel {
    func createAccount(completion: @escaping (Bool) -> Void) {
        if !isValid() {
            return completion(false)
        }

        let createAccountReq = CreateAccountRequest(name: name, accountType: accountType.title, balance: Double(balance)!)
        AccountService.shared.createAccount(createAccountRequest: createAccountReq) { (result) in
            //TODO
        }
    }
}
