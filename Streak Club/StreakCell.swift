//
//  StreakCell.swift
//  Streak Club
//
//  Created by Kevin Hwang on 10/24/15.
//  Copyright © 2015 Kevin Hwang. All rights reserved.
//

import Foundation

final class StreakCell: UICollectionViewCell {
    let titleLabel: UILabel
    let draftLabelContainer: UIView
    let draftLabel: UILabel
    let authorLabel: UILabel
    let durationLabel: UILabel
    let divider: UIView
    let progressView: UIProgressView
    
    init(viewModel: KHStreakCellViewModel) {
        super.init()
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
