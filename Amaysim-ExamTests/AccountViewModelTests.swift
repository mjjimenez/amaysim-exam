//
//  AccountViewModelTests.swift
//  Amaysim-ExamTests
//
//  Created by Mark Jeremiah Jimenez on 16/10/2017.
//  Copyright © 2017 Mark Jeremiah Jimenez. All rights reserved.
//

import XCTest

class AccountViewModelTests: XCTestCase {

    var accountViewModel: AccountViewModel!
    
    override func setUp() {
        super.setUp()

        let account = Account(id: "account_id", paymentType: "payment_type", unbilledCharges: nil, title: "Mr.", firstName: "Mark", lastName: "Jimenez", dateOfBirth: "1-1-1", contactNumber: "12345", emailAddress: "email@email.com", isEmailAddressVerified: true, isEmailSubscribed: true)

        let product = Product(id: "product_id", name: "Product Name", includedData: nil, includedInternationalTalk: nil, hasUnlimitedText: true, hasUnlimitedTalk: true, hasUnlimitedInternationalText: true, hasUnlimitedInternationalTalk: true, price: 1030)

        let subscription = Subscription(id: "subscription_id", includedDataBalance: 35333, includedCreditBalance: nil, includedRolloverCreditBalance: nil, includedRolloverDataBalance: nil, includedInternationalTalkBalance: nil, expiryDate: "1-2-3", isAutoRenewed: true, isPrimarySubscription: true)

        let service = Service(id: "service_id", msn: "12345", credit: 12345, creditExpirationDate: "1-2-3", dataUsageThreshold: true)

        let accountDocument = AccountDocument(accountResource: account, service: service, subscription: subscription, product: product)

        accountViewModel = AccountViewModel(accountDocument: accountDocument)

    }

    func testNameText() {

        XCTAssertEqual("Mark Jimenez", accountViewModel.nameText)

    }

    func testDataBalanceText() {

        XCTAssertEqual("34.50 GB", self.accountViewModel.dataBalanceText)

    }

    func testProductNameText() {
        XCTAssertEqual("Product Name", self.accountViewModel.productNameText)
    }

    func testProductPriceText() {
        XCTAssertEqual("Price: $ 10.30", self.accountViewModel.productPriceText)
    }
    

    func testExpirationDateText() {
        XCTAssertEqual("Expiration Date: 1-2-3", self.accountViewModel.expirationDateText)
    }
}
