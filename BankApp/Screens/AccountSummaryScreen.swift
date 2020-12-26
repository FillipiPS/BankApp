//
//  AccountSummaryScreen.swift
//  BankApp
//
//  Created by Fillipi Paiva Suszek on 22/12/20.
//

import SwiftUI

enum ActiveSheet {
    case addAccount
    case transferFunds
}

struct AccountSummaryScreen: View {
    @ObservedObject private var accountSummaryVM = AccountSummaryViewModel()
    @State private var isPresented: Bool = false
    @State private var activeSheet: ActiveSheet = .addAccount

    var body: some View {
        VStack {
            GeometryReader { g in
                VStack {
                    AccountListView(accounts: accountSummaryVM.accounts)
                        .frame(height: g.size.height/2)
                    Text("\(accountSummaryVM.total.formarAsCurrency())")
                    Spacer()
                    Button("Transfer Funds") {
                        self.activeSheet = .transferFunds
                        self.isPresented = true
                    }.padding()
                }
            }
        }
        .onAppear(perform: {
            self.accountSummaryVM.getAllAccounts()
        })
        .sheet(isPresented: $isPresented, onDismiss: {
            self.accountSummaryVM.getAllAccounts()
        }, content: {
            switch self.activeSheet {
            case .transferFunds:
                TransferFundsScreen()
            case .addAccount:
                AddAccountScreen()
            }
        })
        .navigationBarItems(trailing: Button("Add Acount") {
            self.activeSheet = .addAccount
            self.isPresented = true
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
