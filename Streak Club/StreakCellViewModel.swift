//
//  StreakCellViewModel.swift
//  Streak Club
//
//  Created by Kevin Hwang on 10/23/15.
//  Copyright © 2015 Kevin Hwang. All rights reserved.
//

import Foundation

// TODO: Make this into a struct when we're all Swift
class StreakCellViewModel: NSObject {
    let title: String
    let author: String
    let duration: String
    let progressPercentage: Float
    let draft: Bool
    let participants: Int
    let submissions: Int
    
    init(streak: KHStreakModel) {
        title = streak.title
        author = String(format: NSLocalizedString("by %@", comment: "Author of a given streak, i.e.: by {Rick}"), streak.host.username)
        
        let startDateString = _dateToString(streak.startDate)
        let endDateString = _dateToString(streak.endDate)
        let rateString = _rateToString(streak.rate)
        duration = String(format: NSLocalizedString("%@ from %@ to %@", comment: "Display of how long a given streak lasts. Example: Daily from June 15th to June 20th"), rateString, startDateString, endDateString)
        
        let totalStreakLength = Float(_daysBetweenDate(streak.startDate, toDateTime: streak.endDate))
        let timeElapsed = Float(_daysBetweenDate(streak.startDate, toDateTime: NSDate()))
        progressPercentage = timeElapsed / totalStreakLength
        draft = streak.publishStatus == KHStreakPublishStatus.Draft
        participants = streak.usersCount.integerValue
        submissions = streak.submissionsCount.integerValue
    }
}

private func _dateToString(date: NSDate) -> String {
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
    
    return dateFormatter.stringFromDate(date)
}

//TODO: Make KHStreakRate a proper Swift enum.
private func _rateToString(rate: KHStreakRate) -> String {
    switch rate {
    case .Daily:
        return "Daily"
    case .Weekly:
        return "Weekly"
    }
}

private func _daysBetweenDate(fromDateTime: NSDate, toDateTime: NSDate) -> Int {
    
    var fromDate: NSDate?
    var toDate: NSDate?
    
    let calendar = NSCalendar.currentCalendar()
    
    calendar.rangeOfUnit(NSCalendarUnit.Day, startDate:&fromDate, interval: nil, forDate: fromDateTime)
    calendar.rangeOfUnit(NSCalendarUnit.Day, startDate:&toDate, interval: nil, forDate: toDateTime)
    
    if let fromDate = fromDate, toDate = toDate {
        let difference = calendar.components(NSCalendarUnit.Day, fromDate: fromDate, toDate: toDate, options: [])
        return difference.day
    } else {
        return 0
    }
}