//
//  PlayerStatisticsViewController.swift
//  PlayerStatistics
//
//  Created by raman singh on 06/02/19.
//  Copyright © 2019 raman singh. All rights reserved.
//

import UIKit

class PlayerStatisticsViewController: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var statsTableView: UITableView!
    
    //MARK:- Variable and Constants
    let matchID = "NRL20172101"
    var teamIdForSeque:String?
    var playerIdForSeque:String?
    
    private var viewModel:PlayerStatisticsViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = PlayerStatisticsViewModel(matchId: matchID)
        prepareTableView()
        observeEvents()
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    private func prepareTableView(){
        StatTableViewCell.registerWithTable(statsTableView)
        statsTableView.rowHeight = 120
    }
    
    private func observeEvents(){
        viewModel?.reloadTable = {[weak self] in
            DispatchQueue.main.async {
                self?.statsTableView.reloadData()
            }
        }
    }
    
    private func navigateToPlayerDetailsScreen(teamId:String, playerId:String){
        teamIdForSeque = teamId
        playerIdForSeque = playerId
        self.performSegue(withIdentifier: Constants.Seques.playerDetailsSeque, sender: nil)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.Seques.playerDetailsSeque {
            if let destinationVC = segue.destination as? PlayerDetailsViewController {
                destinationVC.playerId = self.playerIdForSeque
                destinationVC.teamId = self.teamIdForSeque
            }
        }
    }
}

extension PlayerStatisticsViewController:UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.statsArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.statsArray?[section].teamA.topPlayers.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = statsTableView.dequeueReusableCell(withIdentifier: StatTableViewCell.reuseIdentifier, for: indexPath) as! StatTableViewCell
        cell.selectionStyle = .none
        let teamAPlayer = viewModel!.getTeamAPlayerAtIndex(statIndex: indexPath.section, playerIndex: indexPath.row)
        let teamBPlayer = viewModel!.getTeamBPlayerAtIndex(statIndex: indexPath.section, playerIndex: indexPath.row)
        cell.configureCell(playerTeamA: teamAPlayer, playerTeamB: teamBPlayer)
        cell.teamAImageTapped = {[weak self] in
            
            self?.navigateToPlayerDetailsScreen(teamId: self!.viewModel!.getTeamAIdAtIndex(statIndex: indexPath.section), playerId: (teamAPlayer.id)!)
        }
        cell.teamBImageTapped = {[weak self] in
            self?.navigateToPlayerDetailsScreen(teamId: self!.viewModel!.getTeamBIdAtIndex(statIndex: indexPath.section), playerId: (teamBPlayer.id)!)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel?.statsArray?[section].statType.removeUnderScore().capitalizingFirstLetter()
    }
}
