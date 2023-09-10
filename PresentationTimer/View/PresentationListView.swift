//
//  PresentationListView.swift
//  PresentationTimer
//
//  Created by iwashita on 2022/12/25.
//

import SwiftUI

struct PresentationListView: View {
    @ObservedObject var viewModel = PresentationListViewModel.shared
    
    var body: some View {
        List {
            VStack {
                Text("Title")
                    .font(.title3)
                Text("Description")
                    .font(.caption)
            }
            .swipeActions(edge: .trailing) {
                Button {
                    print("delete todo")
                } label: {
                    Image(systemName: "trash")
                }
                .tint(.red)
            }
        }
        .navigationTitle("Presentations")
        .toolbar {
            ToolbarItem(placement: .automatic) {
                Button {
                    viewModel.isShowAddView.toggle()
                } label: {
                    Image(systemName: "plus")
                        .font(.title2)
                }
            }
        }
        .sheet(isPresented: $viewModel.isShowAddView) {
            NavigationView {
                AddPresentationView()
            }
        }
    }
}

struct PresentationListView_Previews: PreviewProvider {
    static var previews: some View {
        PresentationListView()
    }
}
