//
//  TransferFundsViewModel.swift
//  BankApp
//
//  Created by Fillipi Paiva Suszek on 25/12/20.
//

import Foundation

class TransferFundsViewModel: ObservableObject {
    @Published var accounts = [AccountViewModel]()
    @Published var message: String?

    var fromAccount: AccountViewModel?
    var toAccount: AccountViewModel?
    var amount = ""
    var isAmountValid: Bool {
        guard let userAmount = Double(amount) else {
            return false
        }

        return userAmount <= 0 ? false : true
    }

    var filterAccounts: [AccountViewModel] {
        if self.fromAccount == nil {
            return accounts
        } else {
            return accounts.filter {
                guard let fromAccount = self.fromAccount else {
                    return false
                }
                return $0.accountId != fromAccount.accountId
            }
        }
    }

    var fromAccountType: String {
        fromAccount != nil ? fromAccount!.accountType : ""
    }

    var toAccountType: String {
        toAccount != nil ? toAccount!.accountType : ""
    }

    private func isValid() -> Bool {
        return isAmountValid
    }

    func submitTransfer(completion: @escaping () -> Void) {
        if !isValid() {
            return
        }
 
        guard let fromAccount = fromAccount,
              let toAccount = toAccount,
              let amount = Double(amount) else {
            return
        }

        let transferFundRequest = TransferFundRequest(accountFromId: fromAccount.accountId.lowercased(), accountToId: toAccount.accountId.lowercased(), amount: amount)
        AccountService.shared.transferFunds(transferFundRequest: transferFundRequest) { result in
            switch result {
            case .success(let response):
                if response.success {
                    completion()
                } else {
                    self.message = response.error
                }
            case .failure(let error):
                self.message = error.localizedDescription
            }
        }
    }

    func populateAccounts() {
        AccountService.shared.getAllAccounts { result in
            switch result {
            case .success(let accounts):
                if let accounts = accounts {
                    DispatchQueue.main.async {
                        self.accounts = accounts.map(AccountViewModel.init)
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
