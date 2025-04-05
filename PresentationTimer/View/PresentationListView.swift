//
//  PresentationListView.swift
//  PresentationTimer
//
//  Created by iwashita on 2022/12/25.
//

import SwiftUI

struct PresentationListView: View {
    @ObservedObject var viewModel = PresentationListViewModel.shared
    @State private var searchKeyword: String = ""
    
    let data: [PresentationModel] = [
        PresentationModel(
            title: "Bachelor thesis defence",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
        ),
        PresentationModel(
            title: "Lab Presentation",
            description: "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
        )
    ]
    
    var displayData: [PresentationModel] {
        get {
            if searchKeyword == "" {
                return data
            }
            return data.filter({
                $0.title.lowercased().contains(searchKeyword.lowercased()) || $0.description.lowercased().contains(searchKeyword.lowercased())
            })
        }
    }
    
    var body: some View {
        List {
            ForEach(displayData, id: \.self) { presentation in
                VStack(alignment: .leading) {
                    Text(presentation.title)
                        .font(.title3)
                    Text(presentation.description)
                        .font(.caption)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.gray/*@END_MENU_TOKEN@*/)
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
        }
        .searchable(text: $searchKeyword, placement: .toolbar, prompt: "Search Presentations")
            .textInputAutocapitalization(.never)
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
