//
//  Product.swift
//  Amaysim-Exam
//
//  Created by Mark Jeremiah Jimenez on 15/10/2017.
//  Copyright © 2017 Mark Jeremiah Jimenez. All rights reserved.
//

import Foundation

struct Product {
    let id: String
    let name: String
    let includedData: Double?
    let includedInternationalTalk: Double?
    let hasUnlimitedText: Bool
    let hasUnlimitedTalk: Bool
    let hasUnlimitedInternationalText: Bool
    let hasUnlimitedInternationalTalk: Bool
    let price: Double


    enum CodingKeys: String, CodingKey {
        case type
        case id
        case attributes
    }

    enum AttributesCodingKeys: String, CodingKey {
        case name
        case includedData = "included-data"
        case includedInternationalTalk = "included-international-talk"
        case hasUnlimitedText = "unlimited-text"
        case hasUnlimitedTalk = "unlimited-talk"
        case hasUnlimitedInternationalText = "unlimited-international-text"
        case hasUnlimitedInternationalTalk = "unlimited-international-talk"
        case price
    }
}

extension Product: Decodable {

    init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = try container.decode(String.self, forKey: .id)

        let attributesContainer = try container.nestedContainer(keyedBy: AttributesCodingKeys.self, forKey: .attributes)

        name = try attributesContainer.decode(String.self, forKey: .name)
        includedData = try attributesContainer.decodeIfPresent(Double.self, forKey: .includedData)
        includedInternationalTalk = try attributesContainer.decodeIfPresent(Double.self, forKey: .includedInternationalTalk)
        hasUnlimitedText = try attributesContainer.decode(Bool.self, forKey: .hasUnlimitedText)
        hasUnlimitedTalk = try attributesContainer.decode(Bool.self, forKey: .hasUnlimitedTalk)
        hasUnlimitedInternationalText = try attributesContainer.decode(Bool.self, forKey: .hasUnlimitedInternationalText)
        hasUnlimitedInternationalTalk = try attributesContainer.decode(Bool.self, forKey: .hasUnlimitedInternationalTalk)
        price = try attributesContainer.decode(Double.self, forKey: .price)
    }
}
