//
//  SplashViewModel.swift
//  Amaysim-Exam
//
//  Created by Mark Jeremiah Jimenez on 15/10/2017.
//  Copyright © 2017 Mark Jeremiah Jimenez. All rights reserved.
//

import Foundation

class SplashViewModel {

    private let account: Account

    var welcomeGreeting: String {
        return "Welcome back \(account.title) \(account.firstName) \(account.lastName)"
    }

    init(account: Account) {
        self.account = account
    }

}
