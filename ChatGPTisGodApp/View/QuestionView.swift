//
//  QuestionView.swift
//  ChatGPTisGodApp
//
//  Created by Nao RandD on 2023/03/12.
//

import SwiftUI

struct QuestionView: View {
    @State var userInputText = ""

    var body: some View {
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
                    Text("神の答え")
                }
            }
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
    }
}
