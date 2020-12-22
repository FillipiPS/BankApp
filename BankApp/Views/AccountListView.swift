//
//  AccountListView.swift
//  BankApp
//
//  Created by Fillipi Paiva Suszek on 22/12/20.
//

import SwiftUI

struct AccountListView: View {
    let accounts: [AccountViewModel]

    var body: some View {
        List(accounts, id: \.accountId) { account in
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text(account.name)
                        .font(.headline)
                    Text(account.accountType)
                        .opacity(0.5)
                }
                Spacer()
                Text("\(account.balance.formarAsCurrency())")
                    .foregroundColor(.green)
            }
        }
    }
}

struct AccountListView_Previews: PreviewProvider {
    static var previews: some View {
        let account = Account(id: UUID(uuidString: "c9c547ad-9d04-4ab8-a4fb-222f5135e2fa")!, name: "Me", accountType: .checking, balance: 1212.12)
        
        AccountListView(accounts: [AccountViewModel(account: account)])
    }
}
