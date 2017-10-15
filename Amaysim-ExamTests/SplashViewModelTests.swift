//
//  SplashViewModelTests.swift
//  Amaysim-ExamTests
//
//  Created by Mark Jeremiah Jimenez on 16/10/2017.
//  Copyright © 2017 Mark Jeremiah Jimenez. All rights reserved.
//

import XCTest

class SplashViewModelTests: XCTestCase {

    var splashViewModel: SplashViewModel!
    
    override func setUp() {
        super.setUp()

        let account = Account(id: "account_id", paymentType: "payment_type", unbilledCharges: nil, title: "Mr.", firstName: "Mark", lastName: "Jimenez", dateOfBirth: "1-1-1", contactNumber: "12345", emailAddress: "email@email.com", isEmailAddressVerified: true, isEmailSubscribed: true)
        splashViewModel = SplashViewModel(account: account)
    }

    func testGreeting() {

        XCTAssertEqual(splashViewModel.welcomeGreeting, "Welcome back Mr. Mark Jimenez")

    }

}
