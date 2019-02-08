//
//  PlayerStatisticsViewModel.swift
//  PlayerStatistics
//
//  Created by raman singh on 06/02/19.
//  Copyright © 2019 raman singh. All rights reserved.
//

import Foundation

protocol PlayerStatistics{
    func getPlayerStatisticsFromServer()
}

class PlayerStatisticsViewModel: PlayerStatistics {
    //MARK:- Variables and Constants
    var matchId:String?
    var statsArray:[StatViewModel]?
    
    //MARK:- Events
    /// Callback to reload the table.
    var reloadTable: ()->() = { }
    
    //MARK:- Initialisation
    init(matchId:String) {
        self.matchId = matchId
        getPlayerStatisticsFromServer()
    }
    
    func getPlayerStatisticsFromServer() {
        PlayerStatisticsServiceRequest().getMatchStatsFromServer(matchId: matchId!) { (stats, error) in
            var statsArray = [StatViewModel]()
            for stat in stats!{
                statsArray.append(StatViewModel(stat: stat))
            }
            self.statsArray = statsArray
            self.reloadTable()
        }
    }
    
    func getTeamAPlayerAtIndex(statIndex:Int, playerIndex:Int) -> PlayerViewModel {
        return statsArray![statIndex].teamA.topPlayers[playerIndex]
    }
    
    func getTeamBPlayerAtIndex(statIndex:Int, playerIndex:Int) -> PlayerViewModel {
        return statsArray![statIndex].teamB.topPlayers[playerIndex]
    }
    
    func getTeamAIdAtIndex(statIndex:Int) -> String {
        return statsArray![statIndex].teamA.id
    }
    
    func getTeamBIdAtIndex(statIndex:Int) -> String {
        return statsArray![statIndex].teamB.id
    }
}
