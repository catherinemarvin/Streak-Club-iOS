//
//  StreakCellViewModel.swift
//  Streak Club
//
//  Created by Kevin Hwang on 10/23/15.
//  Copyright © 2015 Kevin Hwang. All rights reserved.
//

import Foundation

struct StreakCellViewModel {
    let title: String
    let author: String
    let duration: String
    let progressPercentage: Float
    let draft: Bool
    let participants: Int
    let submissions: Int
    
    init(streak: KHStreakModel) {
       title = streak.title
    }
}