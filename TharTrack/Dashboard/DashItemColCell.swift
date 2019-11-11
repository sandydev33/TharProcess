//
//  DashItemColCell.swift
//  TharTrack
//
//  Created by Esoft on 17/10/19.
//  Copyright © 2019 Esoft. All rights reserved.
//

import UIKit

class DashItemColCell: UICollectionViewCell {

    @IBOutlet weak var circleView: UIView!
    @IBOutlet weak var innerCircleView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        circleView.layer.cornerRadius = circleView.frame.size.width/2
        circleView.clipsToBounds = true
        innerCircleView.layer.cornerRadius = innerCircleView.frame.size.width/2
        innerCircleView.clipsToBounds = true
    }

}
