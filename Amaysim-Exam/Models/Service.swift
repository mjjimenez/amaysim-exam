//
//  Service.swift
//  Amaysim-Exam
//
//  Created by Mark Jeremiah Jimenez on 15/10/2017.
//  Copyright © 2017 Mark Jeremiah Jimenez. All rights reserved.
//

import Foundation

struct Service {
    let id: String
    let msn: String
    let credit: Double
    let creditExpirationDate: String
    let dataUsageThreshold: Bool

    enum CodingKeys: String, CodingKey {
        case type
        case id
        case attributes
    }

    enum AttributesCodingKeys: String, CodingKey {
        case msn
        case credit
        case creditExpirationDate = "credit-expiry"
        case dataUsageThreshold = "data-usage-threshold"
    }
}

extension Service: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = try container.decode(String.self, forKey: .id)

        let attributesContainer = try container.nestedContainer(keyedBy: AttributesCodingKeys.self, forKey: .attributes)

        msn = try attributesContainer.decode(String.self, forKey: .msn)
        credit = try attributesContainer.decode(Double.self, forKey: .credit)
        creditExpirationDate = try attributesContainer.decode(String.self, forKey: .creditExpirationDate)
        dataUsageThreshold = try attributesContainer.decode(Bool.self, forKey: .dataUsageThreshold)

    }
}
