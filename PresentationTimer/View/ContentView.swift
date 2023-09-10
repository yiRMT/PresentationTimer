//
//  ContentView.swift
//  PresentationTimer
//
//  Created by iwashita on 2022/09/01.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            PresentationListView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
