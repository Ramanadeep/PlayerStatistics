//
//  PlayerStatisticsRequest.swift
//  PlayerStatistics
//
//  Created by raman singh on 06/02/19.
//  Copyright © 2019 raman singh. All rights reserved.
//

import Foundation

struct PlayerStatisticsServiceRequest {
    
    func getMatchStatsFromServer(matchId:String, completion: @escaping ([Stat]?, _ error: Error?)->()) {
        let url = Constants.WebServicesApi.getStats + matchId + "/topplayerstats.json;type=fantasy_points;type=tackles;type=runs;type=run_metres?limit=5&userkey=" + Constants.APIConfig.userKey        
        WebServiceManager.sharedService.requestAPI(url: url, parameter: nil, httpMethodType: .GET) { (data, error) in
            if error != nil{
                completion(nil, error)
            }else{
                let statsList = try? JSONDecoder().decode(Stats.self, from: data!)
                completion(statsList, nil)
            }
        }
    }
    
    func getPlayerDetailsFromServer(playerId:String, teamId:String, completion: @escaping (Player?, _ error: Error?)->()) {
        let url = Constants.WebServicesApi.getPlayer + teamId + "/players/" + playerId + "/detailedstats.json?&userkey=" + Constants.APIConfig.userKey
        WebServiceManager.sharedService.requestAPI(url: url, parameter: nil, httpMethodType: .GET) { (data, error) in
            if error != nil{
                completion(nil, error)
            }else{
                let player = try? JSONDecoder().decode(Player.self, from: data!)
                completion(player, nil)
            }
        }
    }
}

