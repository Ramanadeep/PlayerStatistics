//
//  PlayerViewModel.swift
//  PlayerStatistics
//
//  Created by raman singh on 06/02/19.
//  Copyright © 2019 raman singh. All rights reserved.
//

import Foundation

class PlayerViewModel {
    let id: Int?
    let position: String?
    let shortName:String?
    let statValue, jumperNumber: Int?
    //var player = Player
    
    
    init(player:Player) {
        self.id = player.id
        self.jumperNumber = player.jumperNumber
        self.position = player.position
        self.shortName = player.shortName
        self.statValue = player.statValue
    }
    
}
