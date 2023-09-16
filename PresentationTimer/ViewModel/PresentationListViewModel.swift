//
//  PresentationViewModel.swift
//  PresentationTimer
//
//  Created by iwashita on 2022/12/25.
//

import Foundation

final class PresentationListViewModel: ObservableObject {
    @Published var isShowAddView = false
    static let shared = PresentationListViewModel()
    
    @Published var presentationList: [PresentationModel] = []
    
    private init(isShowAddView: Bool = false) {
        self.isShowAddView = isShowAddView
    }
}
