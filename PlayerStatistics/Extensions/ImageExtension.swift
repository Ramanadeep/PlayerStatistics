//
//  ImageExtension.swift
//  PlayerStatistics
//
//  Created by raman singh on 08/02/19.
//  Copyright © 2019 raman singh. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView{
    func setImage(url:String, placeHolderImage:String) {
        let url = URL(string: url)
        self.kf.setImage(
            with: url,
            placeholder: UIImage(named: placeHolderImage),
            options: [
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
    }
}
