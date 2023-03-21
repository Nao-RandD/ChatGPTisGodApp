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
        VStack {
            Text("神からの回答")
                .font(.largeTitle.weight(.bold))
            switch viewModel.state {
            case .loading:
                LottieView(resourceType: .loading)
            case .complete(let result):
                switch result {
                case .success(let answer):
                    Text(answer)
                        .font(.title2.weight(.bold))
                        .frame(height: 300)
                case .failure(_):
                    Text("神との通信に失敗しました")
                }
            }
        }
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
