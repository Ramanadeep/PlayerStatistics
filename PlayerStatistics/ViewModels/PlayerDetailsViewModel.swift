//
//  PlayerDetailsViewModel.swift
//  PlayerStatistics
//
//  Created by raman singh on 08/02/19.
//  Copyright © 2019 raman singh. All rights reserved.
//

import Foundation

class PlayerDetailsViewModel {
    
    //MARK:- Variables
    var teamId:String?
    var playerId:String?
    
    init(teamId:String?, playerId:String?) {
        self.playerId = playerId
        self.teamId = teamId
        getPlayerDetailsFromServer()
    }

    func getPlayerDetailsFromServer() {
        PlayerStatisticsServiceRequest().getPlayerDetailsFromServer(playerId: playerId!, teamId: teamId!) { (player, error) in
            //
        }
    }
}
