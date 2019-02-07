//
//  PlayerStatisticsViewController.swift
//  PlayerStatistics
//
//  Created by raman singh on 06/02/19.
//  Copyright © 2019 raman singh. All rights reserved.
//

import UIKit

class PlayerStatisticsViewController: UIViewController {

    //MARK:- Variable and Constants
    let matchID = "NRL20172101"
    
    private var viewModel:PlayerStatisticsViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
            viewModel = PlayerStatisticsViewModel(matchId: matchID)
        observeEvents()
        // Do any additional setup after loading the view.
    }
    
    private func observeEvents(){
        viewModel?.reloadTable = {[weak self] in
            DispatchQueue.main.async {
                //self?.tableView.reloadData()
                //self?.isRefreshInProgress = false
                //ActivityIndicator.sharedIndicator.hideActivityIndicator()
            }
        }
        viewModel?.statsViewModelArray = {[weak self] statsArray in
            print("PRINTINGGGGGgggggg------>", statsArray.count)
        }
        
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
