//
//  Subscription.swift
//  Amaysim-Exam
//
//  Created by Mark Jeremiah Jimenez on 15/10/2017.
//  Copyright © 2017 Mark Jeremiah Jimenez. All rights reserved.
//

import Foundation

struct Subscription {
    let id: String
    let includedDataBalance: Double?
    let includedCreditBalance: Double?
    let includedRolloverCreditBalance: Double?
    let includedRolloverDataBalance: Double?
    let includedInternationalTalkBalance: Double?
    let expiryDate: String
    let isAutoRenewed: Bool
    let isPrimarySubscription: Bool

    enum CodingKeys: String, CodingKey {
        case type
        case id
        case attributes
    }

    enum AttributesCodingKeys: String, CodingKey {
        case includedDataBalance = "included-data-balance"
        case includedCreditBalance = "included-credit-balance"
        case includedRolloverCreditBalance = "included-rollover-credit-balance"
        case includedRolloverDataBalance = "included-rollover-data-balance"
        case includedInternationalTalkBalance  = "included-international-talk-balance"
        case expiryDate = "expiry-date"
        case isAutoRenewed = "auto-renewal"
        case isPrimarySubscription = "primary-subscription"
    }

}

extension Subscription: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = try container.decode(String.self, forKey: .id)

        let attributesContainer = try container.nestedContainer(keyedBy: AttributesCodingKeys.self, forKey: .attributes)

        includedDataBalance = try attributesContainer.decodeIfPresent(Double.self, forKey: .includedDataBalance)
        includedCreditBalance = try attributesContainer.decodeIfPresent(Double.self, forKey: .includedCreditBalance)
        includedRolloverCreditBalance = try attributesContainer.decodeIfPresent(Double.self, forKey: .includedRolloverCreditBalance)
        includedRolloverDataBalance = try attributesContainer.decodeIfPresent(Double.self, forKey: .includedRolloverDataBalance)
        includedInternationalTalkBalance = try attributesContainer.decodeIfPresent(Double.self, forKey: .includedInternationalTalkBalance)
        expiryDate = try attributesContainer.decode(String.self, forKey: .expiryDate)
        isAutoRenewed = try attributesContainer.decode(Bool.self, forKey: .isAutoRenewed)
        isPrimarySubscription = try attributesContainer.decode(Bool.self, forKey: .isPrimarySubscription)
    }
}
