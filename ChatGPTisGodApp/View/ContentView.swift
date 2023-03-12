//
//  ContentView.swift
//  ChatGPTisGodApp
//
//  Created by Nao RandD on 2023/03/05.
//

import SwiftUI

struct ContentView: View {
    @State var userInputText = ""

    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "rectangle.portrait.and.arrow.forward.fill")

                    .padding(.horizontal)
                List {
                    Text("あなたの悩みは何ですか？")
                    TextField(
                        "最近仕事が疲れている",
                        text: $userInputText)
                    .onSubmit {
                        // TODO: バリデーションしたい
                    }
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                    .border(.background)
                    .frame(height: 200)
                    NavigationLink(destination: AnswerView(userQuestion: userInputText)) {
                        Text("神に送信")
                    }
                }
                .navigationBarTitle(Text("神との対話"))
                .navigationBarItems(trailing: Text("＋"))
            }
        }
        .onDisappear {
            userInputText = ""
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
