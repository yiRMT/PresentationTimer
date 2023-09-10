//
//  AddPresentationView.swift
//  PresentationTimer
//
//  Created by iwashita on 2022/12/25.
//

import SwiftUI

struct AddPresentationView: View {
    var body: some View {
        List {
            Section(header: Text("タイトル")) {
                TextField("", text: .constant("タイトル"))
            }
            Section(header: Text("デスクリプション")) {
                TextField("", text: .constant("デスクリプション"))
            }
        }
        .navigationTitle("ToDoを追加")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {print("完了")}) {
                    Text("完了")
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {print("キャンセル")}) {
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
