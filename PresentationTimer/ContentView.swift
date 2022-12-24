//
//  ContentView.swift
//  PresentationTimer
//
//  Created by iwashita on 2022/09/01.
//

import SwiftUI

struct ContentView: View {
    var scheduleManager = ScheduleManager()
    
    @State var progress: Double = 0.3
    @State var currentTitle = ""
    @State var isCounting = false
    
    var progressWidth: Double = 50
    @State var schedules: [Schedule] = [
        Schedule(title: "Introduction", startTime: 0, endTime: 10, duration: 10),
        Schedule(title: "Related works", startTime: 10, endTime: 180, duration: 170),
        Schedule(title: "Methods", startTime: 180, endTime: 250, duration: 70),
        Schedule(title: "Experiments", startTime: 250, endTime: 370, duration: 120),
        Schedule(title: "Results", startTime: 370, endTime: 540, duration: 170),
        Schedule(title: "Conclusion", startTime: 540, endTime: 600, duration: 60)
    ]
    
    @State var totalTime: Int = 600
    
    @ObservedObject var stopwatchManager = StopwatchManager()
    
    var body: some View {
        VStack {
            ZStack {
                ForEach(schedules, id: \.self) { schedule in
                    CircleProgressView(from: Double(schedule.startTime)/Double(totalTime), to: Double(schedule.endTime)/Double(totalTime), width: progressWidth, color: schedule.color)
                }
                
                CircleProgressView(from: 0, to: progress, width: progressWidth, color: .white.opacity(0.8))
                VStack {
                    Text(currentTitle)
                        .font(.title)
                    HStack {
                        Text(String(format:"%02d",Int(stopwatchManager.secondsElapsed) / 60))
                        Text(":")
                        Text(String(format:"%02d",Int(stopwatchManager.secondsElapsed) % 60))
                    }
                }
            }
            .frame(width: 300)
            .padding(.all)
            .onChange(of: self.stopwatchManager.secondsElapsed) { currentTime in
                progress = Double(currentTime)/Double(totalTime)
                currentTitle = scheduleManager.currentTopic(time: Int(currentTime), schedules: schedules)
            }
            HStack {
                Button(isCounting ? "Pause" : "Start") {
                    if isCounting {
                        stopwatchManager.timer.invalidate()
                        
                    } else {
                        self.stopwatchManager.start()
                    }
                    isCounting.toggle()
                }
                Button("Stop") {
                    self.stopwatchManager.timer.invalidate()
                    self.stopwatchManager.secondsElapsed = 0
                    isCounting = false
                }
            }
            .padding(.all)
            List {
                ForEach(schedules, id: \.self) { schedule in
                    HStack {
                        Text(schedule.title)
                        Spacer()
                        Text(String(format: "%02d", schedule.duration / 60) + ":" + String(format: "%02d", schedule.duration % 60))
                    }
                }.onDelete { indexSet in
                    
                    schedules.remove(atOffsets: indexSet)
                }.onMove { indices, newOffset in
                    schedules.move(fromOffsets: indices, toOffset: newOffset)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
