//
//  Schedule.swift
//  PresentationTimer
//
//  Created by iwashita on 2022/09/02.
//

import Foundation
import RealmSwift

class Presentation: Object {
    init(title: String) {
        self.presentationTitle = title
    }
    
    @Persisted var presentationTitle: String
    var schedule = List<Schedule>()
}

class Schedule: Object {
    @Persisted var title: String
    @Persisted var startTime: Int
    @Persisted var endTime: Int // Seconds
    @Persisted var duration: Int // Seconds
}

struct ScheduleManager {
    func currentTopic(time: Int, schedules: [Schedule]) -> String {
        let results = schedules.filter({ $0.startTime <= time && time < $0.endTime })
        return results.first?.title ?? ""
    }
}
