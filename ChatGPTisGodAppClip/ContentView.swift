//
//  ContentView.swift
//  ChatGPTisGodAppClip
//
//  Created by Nao RandD on 2023/08/13.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        ZStack {
            Color.backgroundColor(.dark)
                .ignoresSafeArea()
            VStack {
                Text("悩みを投げかけてみよう")
                    .font(.title)
                    .foregroundColor(.white)
                Text("↓↓↓↓↓")
                    .font(.title)
                    .foregroundColor(.white)
                MatchedView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

