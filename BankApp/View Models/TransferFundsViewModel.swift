//
//  TransferFundsViewModel.swift
//  BankApp
//
//  Created by Fillipi Paiva Suszek on 25/12/20.
//

import Foundation

class TransferFundsViewModel: ObservableObject {
    var fromAccount: AccountViewModel?
    var toAccount: AccountViewModel?
    @Published var accounts = [AccountViewModel]()

    var fromAccountType: String {
        fromAccount != nil ? fromAccount!.accountType : ""
    }

    var toAccountType: String {
        toAccount != nil ? toAccount!.accountType : ""
    }

    func populateAccounts() {
        AccountService.shared.getAllAccounts { (result) in
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
