//
//  PresentationModel.swift
//  PresentationTimer
//
//  Created by iwashita on 2023/09/14.
//

import Foundation

struct PresentationModel: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let description: String
    
    init(title: String, description: String) {
        self.title = title
        self.description = description
    }
}
