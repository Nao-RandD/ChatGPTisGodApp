//
//  GodAnswerViewModel.swift
//  ChatGPTisGodApp
//
//  Created by Nao RandD on 2023/03/12.
//

import Foundation
import Combine

enum LoadingState {
    case loading
    case complete(Result<String, Error>)
}

final class GodAnswerViewModel: ObservableObject {
    @Published var state: LoadingState = .loading

    func requestToGod(input: String) {
        Task {
            let validateText = "\(input)、という内容を`150文字以内で回答してもらいたい"
            await request(input: validateText)
        }
    }

    private func request(input: String) async {
        let body = OpenAICompletionRequestData(
            model: "text-davinci-003",
            prompt: input,
            maxTokens: 200,
            temperature: 0)
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(body)
            let request = OpenAIRequest(data: data)
            let result = await APIClient.request(request)
            switch result {
            case .success(let response):
                print(response)
                Task { @MainActor in
                    self.state = .complete(.success(response.choices[0].text))
                }
            case .failure(let error):
                print(error)
                state = .complete(.failure(error))
            }
        } catch {
            state = .complete(.failure(error))
        }
    }
}
