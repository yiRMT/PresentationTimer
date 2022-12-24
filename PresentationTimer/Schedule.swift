//
//  Schedule.swift
//  PresentationTimer
//
//  Created by iwashita on 2022/09/02.
//

import SwiftUI

struct Schedule: Hashable {
    var title: String
    var startTime: Int
    var endTime: Int
    var duration: Int
    var color: Color! = .random
    
    static let example = [
        Schedule(title: "Introduction", startTime: 0, endTime: 10, duration: 10),
        Schedule(title: "Related works", startTime: 10, endTime: 180, duration: 170),
        Schedule(title: "Methods", startTime: 180, endTime: 250, duration: 70),
        Schedule(title: "Experiments", startTime: 250, endTime: 370, duration: 120),
        Schedule(title: "Results", startTime: 370, endTime: 540, duration: 170),
        Schedule(title: "Conclusion", startTime: 540, endTime: 600, duration: 60)
    ]
}

struct ScheduleManager {
    func currentTopic(time: Int, schedules: [Schedule]) -> String {
        let results = schedules.filter({ $0.startTime <= time && time < $0.endTime })
        return results.first?.title ?? ""
    }
}
