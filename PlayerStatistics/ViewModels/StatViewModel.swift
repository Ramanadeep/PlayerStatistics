//
//  StatValueViewModel.swift
//  PlayerStatistics
//
//  Created by raman singh on 06/02/19.
//  Copyright © 2019 raman singh. All rights reserved.
//

import Foundation

class StatViewModel{
    //MARK:- Variables
    let matchID: String
    let teamA, teamB: TeamViewModel
    let statType: String
    
    init(stat:Stat) {
        self.matchID = stat.matchID!
        self.statType = stat.statType!
        self.teamA = TeamViewModel(team: stat.teamA!)
        self.teamB = TeamViewModel(team: stat.teamB!)
    }
}
