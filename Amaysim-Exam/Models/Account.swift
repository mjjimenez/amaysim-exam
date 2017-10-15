//
//  Account.swift
//  Amaysim-Exam
//
//  Created by Mark Jeremiah Jimenez on 15/10/2017.
//  Copyright © 2017 Mark Jeremiah Jimenez. All rights reserved.
//

import Foundation

struct Account {
    let id: String
    let paymentType: String
    let unbilledCharges: Double?
    let title: String
    let firstName: String
    let lastName: String
    let dateOfBirth: String
    let contactNumber: String
    let emailAddress: String
    let isEmailAddressVerified: Bool
    let isEmailSubscribed: Bool

    enum CodingKeys: String, CodingKey {
        case type
        case id
        case attributes
    }

    enum AttributesCodingKeys: String, CodingKey {
        case paymentType = "payment-type"
        case unbilledCharges = "unbilled-charges"
        case title = "title"
        case firstName = "first-name"
        case lastName = "last-name"
        case dateOfBirth = "date-of-birth"
        case contactNumber = "contact-number"
        case emailAddress = "email-address"
        case isEmailAddressVerified = "email-address-verified"
        case isEmailSubscribed = "email-subscription-status"
    }

}

extension Account: Decodable {

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = try container.decode(String.self, forKey: .id)

        let attributesContainer = try container.nestedContainer(keyedBy: AttributesCodingKeys.self, forKey: .attributes)

        paymentType = try attributesContainer.decode(String.self, forKey: .paymentType)
        unbilledCharges = try attributesContainer.decodeIfPresent(Double.self, forKey: .unbilledCharges)
        title = try attributesContainer.decode(String.self, forKey: .title)
        firstName = try attributesContainer.decode(String.self, forKey: .firstName)
        lastName = try attributesContainer.decode(String.self, forKey: .lastName)
        dateOfBirth = try attributesContainer.decode(String.self, forKey: .dateOfBirth)
        contactNumber = try attributesContainer.decode(String.self, forKey: .contactNumber)
        emailAddress = try attributesContainer.decode(String.self, forKey: .emailAddress)
        isEmailAddressVerified = try attributesContainer.decode(Bool.self, forKey: .isEmailAddressVerified)
        isEmailSubscribed = try attributesContainer.decode(Bool.self, forKey: .isEmailSubscribed)


    }
}
