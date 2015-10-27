//
//  StreakProgressBar.swift
//  Streak Club
//
//  Created by Kevin Hwang on 10/14/15.
//  Copyright © 2015 Kevin Hwang. All rights reserved.
//

import UIKit
import SnapKit

final class StreakProgressBar : UIView {
    private let filledInView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hexString: "aada80")
        
        return view
    }()
    
    var completionPercentage: Int = 0 {
        didSet {
            self.setNeedsUpdateConstraints()
        }
    }
    
    init() {
        super.init(frame: CGRectZero)
        self.backgroundColor = UIColor(hexString: "dadada")
        _initializeAutolayout()
    }
    
    private func _initializeAutolayout() {
        self.snp_makeConstraints { (make) -> Void in
            make.height.equalTo(20)
        }
        
        self.filledInView.snp_makeConstraints { (make) -> Void in
            make.left.top.bottom.equalTo(self)
        }
    }
    
    override func updateConstraints() {
        filledInView.snp_updateConstraints { (make) -> Void in
            make.width.equalTo(self).multipliedBy(completionPercentage)
        }
        super.updateConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
