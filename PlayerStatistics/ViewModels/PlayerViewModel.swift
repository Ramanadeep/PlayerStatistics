//
//  PlayerViewModel.swift
//  PlayerStatistics
//
//  Created by raman singh on 06/02/19.
//  Copyright © 2019 raman singh. All rights reserved.
//

import Foundation

class PlayerViewModel {
    let id: String?
    let position: String?
    let shortName:String?
    let statValue, jumperNumber: String?
    
    
    init(player:Player) {
        self.id = String(player.id!)
        self.jumperNumber = String(player.jumperNumber!)
        self.position = player.position
        self.shortName = player.shortName
        self.statValue = String(player.statValue!)
    }
    
}
