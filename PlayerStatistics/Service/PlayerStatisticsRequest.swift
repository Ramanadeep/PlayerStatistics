//
//  PlayerStatisticsRequest.swift
//  PlayerStatistics
//
//  Created by raman singh on 06/02/19.
//  Copyright © 2019 raman singh. All rights reserved.
//

import Foundation
import ObjectMapper

struct PlayerStatisticsServiceRequest {
    
    func getMatchStatsFromServer(matchId:String, completion: @escaping ([Stat]?, _ error: Error?)->()) {
        let url = Constants.WebServicesApi.getStats + matchId + "/topplayerstats.json;type=fantasy_points;type=tackles;type=runs;type=run_metres?limit=5&userkey=" + Constants.APIConfig.userKey        
        WebServiceManager.sharedService.requestAPI(url: url, parameter: nil, httpMethodType: .GET) { (data, error) in
            if error != nil{
                completion(nil, error)
            }else{
                do {
                    let result = try JSONSerialization.jsonObject(with: data!, options: []) as? [[String:Any]]
                    if let theJSONData = try? JSONSerialization.data(
                        withJSONObject: result ?? [],
                        options: []) {
                        let theJSONText = String(data: theJSONData,
                                                 encoding: .ascii)
                        let usersArray = Mapper<Stat>().mapArray(JSONString: theJSONText!)
                        completion(usersArray, nil)
                    }
                } catch {
                    completion(nil, error)
                }
            }
        }
    }
    
    func getPlayerDetailsFromServer(playerId:String, teamId:String, completion: @escaping (Player?, _ error: Error?)->()) {
        let url = Constants.WebServicesApi.getPlayer + teamId + "/players/" + playerId + "/detailedstats.json?&userkey=" + Constants.APIConfig.userKey
        WebServiceManager.sharedService.requestAPI(url: url, parameter: nil, httpMethodType: .GET) { (data, error) in
            if error != nil{
                completion(nil, error)
            }else{
                do {
                    let result = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:Any]
                    if let theJSONData = try? JSONSerialization.data(
                        withJSONObject: result ?? [],
                        options: []) {
                        let theJSONText = String(data: theJSONData,
                                                 encoding: .ascii)
                        let player = Mapper<Player>().map(JSONString: theJSONText!)
                        completion(player, nil)
                    }
                } catch {
                    completion(nil, error)
                }
            }
        }
    }
}

