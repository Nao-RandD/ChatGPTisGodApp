//
//  AnswerView.swift
//  ChatGPTisGodApp
//
//  Created by Nao RandD on 2023/03/12.
//

import SwiftUI

struct AnswerView: View {
    private var userQuestion: String
    @ObservedObject private var viewModel = GodAnswerViewModel()

    init(userQuestion: String) {
        self.userQuestion = userQuestion
    }

    var body: some View {
        NavigationView {
            switch viewModel.state {
            case .loading:
                LottieView(resourceType: .splash)
            case .complete(let result):
                switch result {
                case .success(let answer):
                    Text(answer)
                case .failure(let error):
                    Text("神との通信に失敗しました")
                }
            }
        }
        .navigationTitle("神の答え")
        .navigationBarItems(leading: BackButton(label: "神に追加で尋ねる", action: {

        }))
        .onAppear {
            self.viewModel.requestToGod(input: userQuestion)
        }
    }
}

struct BackButton: View {
    let label: String
    let action: () -> Void

    var body: some View {
        Button(action: action, label: {
            HStack {
                Image(systemName: "chevron.left")
                Text(label)
            }
        })
    }
}
