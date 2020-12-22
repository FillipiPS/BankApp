//
//  View+Extension.swift
//  BankApp
//
//  Created by Fillipi Paiva Suszek on 21/12/20.
//

import Foundation
import SwiftUI

extension View {
    func embedInNavigationView() -> some View {
        NavigationView { self }
    }
}
