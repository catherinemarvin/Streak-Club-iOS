//
//  StreakCell.swift
//  Streak Club
//
//  Created by Kevin Hwang on 10/24/15.
//  Copyright © 2015 Kevin Hwang. All rights reserved.
//

import Foundation

final class StreakCell: UICollectionViewCell {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.regularWithSize(22)
        return label
        }()
    
    private let draftLabelContainer: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hexString: "fe8182")
        view.layer.cornerRadius = 3
        view.layer.masksToBounds = true
        
        return view
        }()
    
    private let draftLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldWithSize(14)
        label.text = NSLocalizedString("Draft", comment: "Label indicating that the current streak is an unpublished draft").uppercaseStringWithLocale(NSLocale.currentLocale())
        label.textColor = UIColor.whiteColor()
        label.textAlignment = NSTextAlignment.Center
        label.layer.cornerRadius = 4
        label.layer.masksToBounds = true
        label.setContentHuggingPriority(UILayoutPriorityDefaultHigh, forAxis: UILayoutConstraintAxis.Horizontal)
        
        return label;
    }()
    
    private let authorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.regularWithSize(16)
        return label
    }()
    
    private let durationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.regularWithSize(14)
        return label
    }()
    
    private let divider: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hexString: "dadada")
        return view
    }()
    
    private let progressView: UIProgressView = {
        let view = UIProgressView(progressViewStyle: UIProgressViewStyle.Default)
        view.trackTintColor = UIColor(hexString: "dadada")
        view.progressTintColor = UIColor(hexString: "aada80")
        return view
    }()
    
    private let submissionsView = CountView()
    
    private let participantsView = CountView()
    
    init(viewModel: KHStreakCellViewModel) {
        super.init(frame: CGRectZero)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
