//
//  ContentView.swift
//  ChatGPTisGodApp
//
//  Created by Nao RandD on 2023/03/05.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        NavigationView {
            QuestionView()
                .navigationBarTitle(Text("神との対話"))
                .navigationBarItems(trailing: Text("＋"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
