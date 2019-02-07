//
//  Stat.swift
//  PlayerStatistics
//
//  Created by raman singh on 06/02/19.
//  Copyright © 2019 raman singh. All rights reserved.
//

import Foundation

typealias Stats = [Stat]

struct Stat: Codable {
    let matchID: String
    let teamA, teamB: Team
    let statType: String
    
    enum CodingKeys: String, CodingKey {
        case matchID = "match_id"
        case teamA = "team_A"
        case teamB = "team_B"
        case statType = "stat_type"
    }
}
