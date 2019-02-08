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
    var position, fullName: String?
    var jumperNumber: String?
    var lastMatchStats: [LastMatchStat] = []
    /// Callback to reload the table.
    var reloadDataOnView: ()->() = { }
    
    init(teamId:String?, playerId:String?) {
        self.playerId = playerId
        self.teamId = teamId
        getPlayerDetailsFromServer()
    }

    func getPlayerDetailsFromServer() {
        PlayerStatisticsServiceRequest().getPlayerDetailsFromServer(playerId: playerId!, teamId: teamId!) { [weak self](player, error) in
            self?.fullName = player?.fullName
            self?.position = player?.position
            for (key, valuee) in (player?.lastMatchStats)! {
                if !(valuee is NSNull) {
                    let lastMatchStat = LastMatchStat(key: key, value: valuee as! String)
                    self?.lastMatchStats.append(lastMatchStat)
                }
            }
            self?.reloadDataOnView()
        }
    }
}
