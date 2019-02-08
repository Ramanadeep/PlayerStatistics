//
//  Stat.swift
//  PlayerStatistics
//
//  Created by raman singh on 06/02/19.
//  Copyright © 2019 raman singh. All rights reserved.
//

import Foundation
import ObjectMapper

typealias Stats = [Stat]

struct Stat: Mappable {
    var matchID: String?
    var teamA, teamB: Team?
    var statType: String?
    init() {}
    init?(map: Map) {
        // check if a required properties exists within the JSON.
        if map.JSON["match_id"] == nil {
            return nil
        }
        if map.JSON["team_A"] == nil {
            return nil
        }
        if map.JSON["team_B"] == nil {
            return nil
        }
        if map.JSON["stat_type"] == nil {
            return nil
        }
    }
    
    mutating func mapping(map: Map) {
        matchID <- map["match_id"]
        teamA <- map["team_A"]
        teamB <- map["team_B"]
        statType <- map["stat_type"]
    }
}
