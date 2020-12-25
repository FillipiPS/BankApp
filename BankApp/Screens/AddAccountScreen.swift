//
//  AddAccountScreen.swift
//  BankApp
//
//  Created by Fillipi Paiva Suszek on 23/12/20.
//

import SwiftUI

struct AddAccountScreen: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject private var addCountVM = AddAccountViewModel()

    var body: some View {
        Form {
            TextField("Name", text: self.$addCountVM.name)
            Picker(selection: self.$addCountVM.accountType, label: EmptyView(), content: {
                ForEach(AccountType.allCases, id: \.self) { accountType in
                    Text(accountType.title).tag(accountType)
                }
            }).pickerStyle(SegmentedPickerStyle())
            TextField("Balance", text: self.$addCountVM.balance)
            HStack {
                Spacer()
                Button("Submit") {
                    self.addCountVM.createAccount { (success) in
                        if success {
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    }
                }
                Spacer()
            }
            Text(self.addCountVM.errorMessage)
        }
        .navigationBarTitle("Add Account")
        .embedInNavigationView()
    }
}

struct AddAccountScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddAccountScreen()
    }
}
