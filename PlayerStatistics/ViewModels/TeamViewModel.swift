//
//  TeamViewModel.swift
//  PlayerStatistics
//
//  Created by raman singh on 06/02/19.
//  Copyright © 2019 raman singh. All rights reserved.
//

import Foundation

class TeamViewModel {
    let id: String
    let name, code, shortName: String
    let topPlayers: [PlayerViewModel]
    //let team:Team
    
    init(team:Team) {
        self.id = String(team.id)
        self.name = team.name
        self.code = team.code
        self.shortName = team.shortName
        //self.team = team
        self.topPlayers = team.topPlayers.map({ return PlayerViewModel(player: $0)})
    }
}
