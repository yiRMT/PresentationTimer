//
//  StopwatchManager.swift
//  PresentationTimer
//
//  Created by iwashita on 2022/09/01.
//

import SwiftUI

class StopwatchManager: ObservableObject {
    @Published var secondsElapsed = 0
    @Published var totalTime = 0
    
    var timer = Timer()

    func start(){
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){ timer in
           self.secondsElapsed += 1
        }
    }
    
    func stop() {
        timer.invalidate()
    }
}
