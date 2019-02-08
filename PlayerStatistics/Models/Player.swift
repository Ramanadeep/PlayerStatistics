//
//  Player.swift
//  PlayerStatistics
//
//  Created by raman singh on 06/02/19.
//  Copyright © 2019 raman singh. All rights reserved.
//

import Foundation
import ObjectMapper

struct Player: Mappable {
    var id: Int?
    var position, fullName, shortName: String?
    var statValue, jumperNumber: Int?
    var lastMatchStats: [String : AnyObject] = [:]
    init?(map: Map) {
        
        id <- map["id"]
        position <- map["position"]
        fullName <- map["full_name"]
        shortName <- map["short_name"]
        jumperNumber <- map["jumper_number"]
        statValue <- map["stat_value"]
        lastMatchStats <- map["last_match_stats"]
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        position <- map["position"]
        fullName <- map["full_name"]
        shortName <- map["short_name"]
        jumperNumber <- map["jumper_number"]
        statValue <- map["stat_value"]
        lastMatchStats <- map["last_match_stats"]
        
    }
}

struct LastMatchStat {
    var key: String?
    var value: String?
    init(key:String, value:String) {
        self.key = key
        self.value = value
    }
}
