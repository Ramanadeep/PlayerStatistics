//
//  Constants.swift
//  PlayerStatistics
//
//  Created by raman singh on 06/02/19.
//  Copyright © 2019 raman singh. All rights reserved.
//

import Foundation

class Constants: NSObject {
    
    private struct Api {
        static let URL = "https://statsapi.foxsports.com.au/"
        static let version = "3.0/"
        static let baseURL = URL + version
    }
    
    struct WebServicesApi {
        static let getStats = Api.baseURL + "api/sports/league/matches/"
        static let getPlayer = Api.baseURL + "api/sports/league/series/1/seasons/115/teams/"
    }
    
    struct APIConfig{
        static let userKey = "A00239D3-45F6-4A0A-810C-54A347F144C2"
    }
    
    struct ImageAPI {
        static let imageURL = "http://media.foxsports.com.au/match-centre/includes/images/headshots/nrl/"
    }
    
    struct Seques {
        static let playerDetailsSeque = "PlayerDetailsSeque"
    }
}

