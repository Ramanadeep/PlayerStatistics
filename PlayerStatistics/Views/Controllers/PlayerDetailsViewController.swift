//
//  PlayerDetailsViewController.swift
//  PlayerStatistics
//
//  Created by raman singh on 08/02/19.
//  Copyright © 2019 raman singh. All rights reserved.
//

import UIKit

class PlayerDetailsViewController: UIViewController {

    //MARK:- IBOutlets
    @IBOutlet weak var playerImageView: UIImageView!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var lastMatchStatsTableView: UITableView!
    @IBOutlet weak var noDataLabel: UILabel!
    
    //MARK:- Variables
    var teamId:String?
    var playerId:String?
    var viewModel:PlayerDetailsViewModel?
    let activityView = UIActivityIndicatorView(style: .gray)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityView.center = self.view.center
        self.view.addSubview(activityView)
        viewModel = PlayerDetailsViewModel(teamId: teamId, playerId: playerId)
        LastMatchStatsTableViewCell.registerWithTable(lastMatchStatsTableView)
        observeEvents()
        showActivityIndicator()
        lastMatchStatsTableView.isHidden = true
        noDataLabel.isHidden = true
    }
    

    private func observeEvents(){
        viewModel?.reloadDataOnView = {[weak self] in
            DispatchQueue.main.async {
                self?.hideActivityIndicator()
                self?.noDataLabel.isHidden = true
                self?.fullNameLabel.text = self?.viewModel!.fullName
                self?.positionLabel.text =  self?.viewModel!.position
                self?.playerImageView.setImage(url: Constants.ImageAPI.imageURL + (self?.playerId)! + ".jpg", placeHolderImage: "playerHeadshot")
                if(self?.viewModel?.lastMatchStats.count == 0){
                    self?.lastMatchStatsTableView.isHidden = true
                }else{
                    self?.lastMatchStatsTableView.isHidden = false
                    self?.lastMatchStatsTableView.reloadData()
                }
            }
        }
    }
    
    private func showActivityIndicator(){
        activityView.startAnimating()
        activityView.isHidden = false
        self.view.bringSubviewToFront(activityView)
    }
    
    private func hideActivityIndicator(){
        activityView.stopAnimating()
        activityView.isHidden = true
    }
}

extension PlayerDetailsViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel!.lastMatchStats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = lastMatchStatsTableView.dequeueReusableCell(withIdentifier: LastMatchStatsTableViewCell.reuseIdentifier, for: indexPath) as! LastMatchStatsTableViewCell
        cell.selectionStyle = .none
        cell.configureCell(lastMatchStat: viewModel!.lastMatchStats[indexPath.row])
        return cell
        
    }
}
