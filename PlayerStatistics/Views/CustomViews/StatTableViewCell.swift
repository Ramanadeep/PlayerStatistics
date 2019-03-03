//
//  StatValueTableViewCell.swift
//  PlayerStatistics
//
//  Created by raman singh on 06/02/19.
//  Copyright © 2019 raman singh. All rights reserved.
//

import UIKit
import Kingfisher

class StatTableViewCell: ReusableTableViewCell {

    /// Callback to getImageTapped Event.
    var teamAImageTapped: ()->() = { }
    var teamBImageTapped: ()->() = { }
    
    //MARK:- IBOutlets
    @IBOutlet weak var teamAImageView: UIImageView!
    @IBOutlet weak var teamAStatValue: UILabel!
    @IBOutlet weak var teamAShortName: UILabel!
    @IBOutlet weak var teamAJumperNumber: UILabel!
    @IBOutlet weak var teamAPosition: UILabel!
    
    @IBOutlet weak var teamBImageView: UIImageView!
    @IBOutlet weak var teamBStatValue: UILabel!
    @IBOutlet weak var teamBShortName: UILabel!
    @IBOutlet weak var teamBJumperNumber: UILabel!
    @IBOutlet weak var teamBPostion: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let tapGestureRecognizerTeamA = UITapGestureRecognizer(target: self, action: #selector(teamAImageTapped(tapGestureRecognizer:)))
        teamAImageView?.isUserInteractionEnabled = true
        teamAImageView?.addGestureRecognizer(tapGestureRecognizerTeamA)
        let tapGestureRecognizerTeamB = UITapGestureRecognizer(target: self, action: #selector(teamBImageTapped(tapGestureRecognizer:)))
        teamBImageView?.isUserInteractionEnabled = true
        teamBImageView?.addGestureRecognizer(tapGestureRecognizerTeamB)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(playerTeamA:PlayerViewModel, playerTeamB:PlayerViewModel) {
        teamAStatValue.text = playerTeamA.statValue
        teamAShortName.text = playerTeamA.shortName
        teamAJumperNumber.text = "Jumper Number: \(playerTeamA.jumperNumber!)"
        teamAPosition.text = "Position: \(playerTeamA.position!)"
        teamBStatValue.text = playerTeamB.statValue
        teamBShortName.text = playerTeamB.shortName
        teamBJumperNumber.text = "Jumper Number: \(playerTeamB.jumperNumber!)"
        teamBPostion.text = "Position: \(playerTeamB.position!)"
        teamAImageView.setImage(url: Constants.ImageAPI.imageURL + playerTeamA.id! + ".jpg", placeHolderImage: "playerHeadshot")
        teamBImageView.setImage(url: Constants.ImageAPI.imageURL + playerTeamB.id! + ".jpg", placeHolderImage: "playerHeadshot")
    }
    
    @objc func teamAImageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        self.teamAImageTapped()
    }
    
    @objc func teamBImageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        self.teamBImageTapped()
    }
    
}
