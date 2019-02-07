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
    
    enum CodingKeys: String, CodingKey {
        case id, position
        case fullName = "full_name"
        case shortName = "short_name"
        case statValue = "stat_value"
        case jumperNumber = "jumper_number"
    }
}
