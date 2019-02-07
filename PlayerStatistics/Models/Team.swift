//
//  Team.swift
//  PlayerStatistics
//
//  Created by raman singh on 06/02/19.
//  Copyright © 2019 raman singh. All rights reserved.
//

import Foundation

struct Team: Codable {
    let id: Int
    let name, code, shortName: String
    let topPlayers: [Player]
    
    enum CodingKeys: String, CodingKey {
        case id, name, code
        case shortName = "short_name"
        case topPlayers = "top_players"
    }
}
