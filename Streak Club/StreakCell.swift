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
    
    init() {
        super.init(frame: CGRectZero)
        
        _configureSubviews()
        _initializeAutolayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func _configureSubviews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(draftLabelContainer)
        draftLabelContainer.addSubview(draftLabel)
        contentView.addSubview(authorLabel)
        contentView.addSubview(durationLabel)
        contentView.addSubview(divider)
        contentView.addSubview(submissionsView)
        contentView.addSubview(participantsView)
        contentView.addSubview(progressView)
    }
    
    private func _initializeAutolayout() {
        let sidePadding = 20
        let verticalOffset = 10
        
        titleLabel.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(contentView).offset(sidePadding)
            make.right.equalTo(draftLabel.snp_left).offset(-sidePadding)
            make.top.equalTo(contentView).offset(sidePadding)
        }
        
        draftLabelContainer.snp_makeConstraints { (make) -> Void in
            make.right.equalTo(contentView).offset(-sidePadding)
            make.top.equalTo(contentView).offset(sidePadding)
            make.height.equalTo(draftLabel)
            make.width.equalTo(draftLabel).offset(10)
        }
        
        draftLabel.snp_makeConstraints { (make) -> Void in
            make.center.equalTo(draftLabelContainer)
        }
        
        authorLabel.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(contentView).offset(sidePadding)
            make.right.equalTo(contentView).offset(-sidePadding)
            make.top.equalTo(titleLabel.snp_bottom).offset(verticalOffset)
        }
        
        durationLabel.snp_makeConstraints { (make) -> Void in
            make.left.right.equalTo(authorLabel)
            make.top.equalTo(authorLabel.snp_bottom).offset(verticalOffset)
        }
        
        divider.snp_makeConstraints { (make) -> Void in
            make.left.right.equalTo(contentView)
            make.top.equalTo(durationLabel.snp_bottom).offset(verticalOffset)
            make.height.equalTo(1)
        }
        
        progressView.snp_makeConstraints { (make) -> Void in
            make.left.right.equalTo(authorLabel)
            make.bottom.equalTo(self.snp_bottom).offset(-verticalOffset)
            make.top.greaterThanOrEqualTo(participantsView.snp_bottom)
        }
        
        participantsView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(divider.snp_bottom).offset(verticalOffset)
            make.left.equalTo(contentView)
            make.right.equalTo(submissionsView.snp_left)
        }
        
        submissionsView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(participantsView)
            make.right.equalTo(contentView)
            make.width.equalTo(participantsView)
        }
    }
}
