//
//  StringExtension.swift
//  PlayerStatistics
//
//  Created by raman singh on 08/02/19.
//  Copyright © 2019 raman singh. All rights reserved.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
    
    func removeUnderScore() -> String{
        return self.replacingOccurrences(of: "_", with: " ", options: .literal, range: nil)
    }
}
