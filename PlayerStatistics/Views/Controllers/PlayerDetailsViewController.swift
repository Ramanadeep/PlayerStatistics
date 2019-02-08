//
//  PlayerDetailsViewController.swift
//  PlayerStatistics
//
//  Created by raman singh on 08/02/19.
//  Copyright © 2019 raman singh. All rights reserved.
//

import UIKit

class PlayerDetailsViewController: UIViewController {

    var teamId:String?
    var playerId:String?
    var viewModel:PlayerDetailsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = PlayerDetailsViewModel(teamId: teamId, playerId: playerId)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
