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
            let validateText = "\(input)、という内容を一文で端的に回答して"
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
                    var removeText = "\n\n"
                    var answer = response.choices[0].text
                    answer = answer.removeBefore(target: removeText)
                    let validate: Set<Character> = ["\"", "\n"]
                    answer.removeAll(where: { validate.contains($0) })
                    self.state = .complete(.success(answer))
                }
            case .failure(let error):
                print(error)
                Task { @MainActor in
                    self.state = .complete(.failure(error))
                }
            }
        } catch {
            state = .complete(.failure(error))
        }
    }
}
