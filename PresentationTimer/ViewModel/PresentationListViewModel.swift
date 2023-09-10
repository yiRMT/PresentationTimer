//
//  PresentationViewModel.swift
//  PresentationTimer
//
//  Created by iwashita on 2022/12/25.
//

import Foundation

class PresentationListViewModel: ObservableObject {
    @Published var isShowAddView = false
    static let shared = PresentationListViewModel()
}
