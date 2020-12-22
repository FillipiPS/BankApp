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
            GeometryReader { g in
                VStack {
                    AccountListView(accounts: accountSummaryVM.accounts)
                        .frame(height: g.size.height/2)
                    Text("\(accountSummaryVM.total.formarAsCurrency())")
                }
            }
        }
        .onAppear(perform: {
            self.accountSummaryVM.getAllAccounts()
        })
        .navigationBarTitle("Account Summary")
        .embedInNavigationView()
    }
}

struct AccountSummaryScreen_Previews: PreviewProvider {
    static var previews: some View {
        AccountSummaryScreen()
    }
}
