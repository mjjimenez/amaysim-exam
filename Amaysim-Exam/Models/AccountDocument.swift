//
//  AccountDocument.swift
//  Amaysim-Exam
//
//  Created by Mark Jeremiah Jimenez on 15/10/2017.
//  Copyright © 2017 Mark Jeremiah Jimenez. All rights reserved.
//

import Foundation

struct AccountDocument {
    let accountResource: Account

    var service: Service?
    var subscription: Subscription?
    var product: Product?


    enum CodingKeys: String, CodingKey {
        case data
        case included
    }

}

extension AccountDocument: Decodable {

    init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)

        accountResource = try container.decode(Account.self, forKey: .data)

        var includedResourceArray = try container.nestedUnkeyedContainer(forKey: .included)

        while !includedResourceArray.isAtEnd {

            if let product = try? includedResourceArray.decode(Product.self) {
                self.product = product
            }

            if let service = try? includedResourceArray.decode(Service.self) {
                self.service = service
            }

            if let subscription = try? includedResourceArray.decode(Subscription.self) {
                self.subscription = subscription
            }

        }


    }
}
