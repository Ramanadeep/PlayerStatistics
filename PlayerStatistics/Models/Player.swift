//
//  Player.swift
//  PlayerStatistics
//
//  Created by raman singh on 06/02/19.
//  Copyright © 2019 raman singh. All rights reserved.
//

import Foundation

struct Player: Codable {
    let id: Int
    let position, fullName, shortName: String
    let statValue, jumperNumber: Int
    //let lastMatchStats: [String: Double?]?
    
    enum CodingKeys: String, CodingKey {
        case id, position
        case fullName = "full_name"
        case shortName = "short_name"
        case statValue = "stat_value"
        case jumperNumber = "jumper_number"
        //case lastMatchStats = "last_match_stats"
    }
}

// MARK: Encode/decode helpers

class JSONNull: Codable, Hashable {
    
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
    
    public var hashValue: Int {
        return 0
    }
    
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
