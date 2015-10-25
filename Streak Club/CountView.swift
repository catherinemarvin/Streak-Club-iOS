//
//  CountView.swift
//  Streak Club
//
//  Created by Kevin Hwang on 10/24/15.
//  Copyright © 2015 Kevin Hwang. All rights reserved.
//

import Foundation
import SnapKit

/**
Displays an interface like "5 views", with the 5 above a centered "views"
*/
final class CountView: UIView {
    let countLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = NSTextAlignment.Center
        label.font = UIFont.regularWithSize(18)
        
        return label
    }()
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = NSTextAlignment.Center
        label.font = UIFont.regularWithSize(18)
        
        return label
    }()
    
    init() {
        super.init(frame: CGRectZero)
        _configureSubviews()
        _initializeAutolayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func _configureSubviews() {
        addSubview(countLabel)
        addSubview(textLabel)
    }
    
    private func _initializeAutolayout() {
        countLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self)
            make.centerX.equalTo(self)
            make.left.right.equalTo(self)
            make.bottom.equalTo(textLabel.snp_top)
        }
        textLabel.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(self)
            make.height.equalTo(countLabel)
            make.bottom.left.right.equalTo(self)
        }
    }
    
    func update(count: Int, text: String) {
        countLabel.text = "\(count)"
        textLabel.text = text
    }
}