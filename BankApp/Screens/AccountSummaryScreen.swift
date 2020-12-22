//
//  AccountSummaryScreen.swift
//  BankApp
//
//  Created by Fillipi Paiva Suszek on 22/12/20.
//

import SwiftUI

struct AccountSummaryScreen: View {
    @ObservedObject private var accountSummaryVM = AccountSummaryViewModel()

    var body: some View {
        VStack {
            AccountListView(accounts: accountSummaryVM.accounts)
            Text("\(accountSummaryVM.total.formarAsCurrency())")
        }
        .onAppear(perform: {
            self.accountSummaryVM.getAllAccounts()
    })

    }
}

struct AccountSummaryScreen_Previews: PreviewProvider {
    static var previews: some View {
        AccountSummaryScreen()
    }
}
