//
//  TransferFundsScreen.swift
//  BankApp
//
//  Created by Fillipi Paiva Suszek on 25/12/20.
//

import SwiftUI

struct TransferFundsScreen: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject private var transferFundsVM = TransferFundsViewModel()
    @State private var showSheet = false
    @State private var isFromAccount = false

    var actionSheetButtons: [Alert.Button] {
        var actionBButtons = self.transferFundsVM.filterAccounts.map { account in
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
        ScrollView {
            VStack {
                AccountListView(accounts: transferFundsVM.accounts)
                    .frame(height: 200)
                TransferFundsAccountSelectionView(transferFundsVM: transferFundsVM, showSheet: $showSheet, isFromAccount: $isFromAccount)
                Spacer()
                    
                    .onAppear(perform: {
                        transferFundsVM.populateAccounts()
                    })
                Text(self.transferFundsVM.message ?? "")
                Button("Submit Transfer") {
                    self.transferFundsVM.submitTransfer {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }.padding()
                
                .actionSheet(isPresented: $showSheet, content: {
                    ActionSheet(title: Text("Transfer Funds"), message: Text("Choose an account"), buttons: self.actionSheetButtons)
                })
            }
        }
        .navigationBarTitle("Transfer Funds")
        .embedInNavigationView()
    }
}

struct TransferFundsScreen_Previews: PreviewProvider {
    static var previews: some View {
        TransferFundsScreen()
    }
}
