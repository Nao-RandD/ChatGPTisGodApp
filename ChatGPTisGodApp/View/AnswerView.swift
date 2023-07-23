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
            case .failure(let error):
                switch error {
                case .apiBusyError:
                    Text("神は人類と今月分の\n相談を終えました\n\n月の始めの相談を\n強くオススメします")
                        .font(.title2.weight(.bold))
                        .frame(height: 300)
                        .multilineTextAlignment(.center)
                    Text("ほんとゴメンナサイ...")
                case .responseError, .decordError, .urlSessionError, .other:
                    Text("神との通信に失敗しました")
                        .font(.title3.weight(.bold))
                        .frame(height: 300)
                }
            case .complete(let answer):
                Text(answer)
                    .font(.title2.weight(.bold))
                    .frame(height: 300)
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
