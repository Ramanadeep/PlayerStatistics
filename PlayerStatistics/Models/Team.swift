//
//  Team.swift
//  PlayerStatistics
//
//  Created by raman singh on 06/02/19.
//  Copyright © 2019 raman singh. All rights reserved.
//

import Foundation
import ObjectMapper

struct Team: Mappable {
    var id: Int?
    var name, code, shortName: String?
    var topPlayers: [Player]?
    init() {}
    init?(map: Map) {
        if map.JSON["id"] == nil {
            return nil
        }
        if map.JSON["name"] == nil {
            return nil
        }
        if map.JSON["code"] == nil {
            return nil
        }
        if map.JSON["short_name"] == nil {
            return nil
        }
        if map.JSON["top_players"] == nil {
            return nil
        }
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        code <- map["code"]
        shortName <- map["short_name"]
        topPlayers <- map["top_players"]
    }
}
