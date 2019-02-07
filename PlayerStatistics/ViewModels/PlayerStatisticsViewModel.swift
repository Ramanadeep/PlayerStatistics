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
    //MARK: Events
    var viewDidLoad: ()->() = {}
    var statsViewModelArray: ([StatViewModel])->() = { _ in }
    /// Callback to reload the table.
    var reloadTable: ()->() = { }
    
    init(matchId:String) {
        self.matchId = matchId
        getPlayerStatisticsFromServer()
    }
    
    func getPlayerStatisticsFromServer() {
        
        PlayerStatisticsServiceRequest().getMatchStatsFromServer(matchId: matchId!) { (stats, error) in
            var fff = [StatViewModel]()
            for a in stats!{
                fff.append(StatViewModel(stat: a))
            }
            self.statsViewModelArray(fff)
        }
    }

}
