//
//  AccountViewModel.swift
//  Amaysim-Exam
//
//  Created by Mark Jeremiah Jimenez on 15/10/2017.
//  Copyright © 2017 Mark Jeremiah Jimenez. All rights reserved.
//

import Foundation

class AccountViewModel {
    let accountDocument: AccountDocument

    var nameText: String {
        return "\(self.accountDocument.accountResource.firstName) \(self.accountDocument.accountResource.lastName)"
    }

    var dataBalanceText: String {

        if let balanceInMB = self.accountDocument.subscription?.includedDataBalance {

            let balanceInGB = (balanceInMB/1024)

            return String(format: "%.2f GB", balanceInGB)

        } else {

            return "Balance currently unavailable"

        }

    }

    var productNameText: String {
        if let productName =  self.accountDocument.product?.name {
            return productName
        } else {
            return "Product unavailable"
        }
    }

    var productPriceText: String {
        if let productPriceInCents = self.accountDocument.product?.price {
            let productPriceInDollars = (productPriceInCents/100)
            return "Price: $ \(productPriceInDollars)"
        } else {
            return "Price unavailable"
        }
    }

    var expirationDateText: String {
        if let expirationDate = self.accountDocument.subscription?.expiryDate {
            return "Expiration Date: \(expirationDate)"
        } else {
            return "Expiration date unavailable."
        }
    }

    init(accountDocument: AccountDocument) {
        self.accountDocument = accountDocument
    }

}
