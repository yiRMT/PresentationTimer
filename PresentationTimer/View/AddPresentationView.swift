//
//  AddPresentationView.swift
//  PresentationTimer
//
//  Created by iwashita on 2022/12/25.
//

import SwiftUI

struct AddPresentationView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        List {
            Section(header: Text("Title")) {
                TextField("", text: .constant("Title"))
            }
            Section(header: Text("Description")) {
                TextField("", text: .constant("Description"))
            }
        }
        .navigationTitle("ToDoを追加")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {print("完了")}) {
                    Text("完了")
                }
            }
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    Text("キャンセル")
                }
            }
        }
    }
}

struct AddPresentationView_Previews: PreviewProvider {
    static var previews: some View {
        AddPresentationView()
    }
}
