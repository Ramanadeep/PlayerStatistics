//
//  LastMatchStatsTableViewCell.swift
//  PlayerStatistics
//
//  Created by raman singh on 08/02/19.
//  Copyright © 2019 raman singh. All rights reserved.
//

import UIKit

class LastMatchStatsTableViewCell: ReusableTableViewCell {
    @IBOutlet weak var lastMatchStatValue: UILabel!
    @IBOutlet weak var lastMatchStatKey: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(lastMatchStat:LastMatchStat) {
        lastMatchStatKey.text = lastMatchStat.key
        lastMatchStatValue.text = lastMatchStat.value
    }
    
}
