//
//  TeamViewModel.swift
//  PlayerStatistics
//
//  Created by raman singh on 06/02/19.
//  Copyright © 2019 raman singh. All rights reserved.
//

import Foundation

class TeamViewModel {
    var id: String
    var name, code, shortName: String
    var topPlayers: [PlayerViewModel] = []
    
    init(team:Team) {
        self.id = String(team.id!)
        self.name = team.name!
        self.code = team.code!
        self.shortName = team.shortName!
        for player in team.topPlayers!{
            topPlayers.append(PlayerViewModel(player: player))
        }
    }
}
