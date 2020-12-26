//
//  TransferFundsScreen.swift
//  BankApp
//
//  Created by Fillipi Paiva Suszek on 25/12/20.
//

import SwiftUI

struct TransferFundsScreen: View {
    @ObservedObject private var transferFundsVM = TransferFundsViewModel()
    @State private var showSheet = false
    @State private var isFromAccount = false

    var actionSheetButtons: [Alert.Button] {
        var actionBButtons = self.transferFundsVM.filterAccounts.map { (account) in
            Alert.Button.default(Text("\(account.name) (\(account.accountType))")) {
                if self.isFromAccount {
                    self.transferFundsVM.fromAccount = account
                } else {
                    self.transferFundsVM.toAccount = account
                }
            }
        }
        actionBButtons.append(.cancel())
        return actionBButtons
    }

    var body: some View {
        VStack {
            AccountListView(accounts: transferFundsVM.accounts)
                .frame(height: 300)
            TransferFundsAccountSelectionView(transferFundsVM: transferFundsVM, showSheet: $showSheet, isFromAccount: $isFromAccount)
                Spacer()

                .onAppear(perform: {
                    transferFundsVM.populateAccounts()
            })

                    .actionSheet(isPresented: $showSheet, content: {
                        ActionSheet(title: Text("Transfer Funds"), message: Text("Choose an account"), buttons: self.actionSheetButtons)
                    })
        }.navigationBarTitle("Transfer Funds")
        .embedInNavigationView()
    }
}

struct TransferFundsScreen_Previews: PreviewProvider {
    static var previews: some View {
        TransferFundsScreen()
    }
}

struct TransferFundsAccountSelectionView: View {
    @ObservedObject var transferFundsVM: TransferFundsViewModel
    @Binding var showSheet: Bool
    @Binding var isFromAccount: Bool

    var body: some View {
        VStack(spacing: 10) {
            Button("From \(self.transferFundsVM.fromAccountType)") {
                self.isFromAccount = true
                self.showSheet = true
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.green)
            .foregroundColor(.white)

            Button("To \(self.transferFundsVM.toAccountType)") {
                self.isFromAccount = false
                self.showSheet = true
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.green)
            .foregroundColor(.white)
            .opacity(self.transferFundsVM.fromAccount != nil ? 1.0 : 0.5)
            .disabled(self.transferFundsVM.fromAccount == nil )
        }.padding()
    }
}
