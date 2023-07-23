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
    case complete(String)
    case failure(APIError)
}

final class GodAnswerViewModel: ObservableObject {
    @Published var state: LoadingState = .loading

    func requestToGod(input: String) {
        Task {
            let script = """
制約条件；
＊ Chatbotの自身を示す一人称は、私です。
＊ Userを示す二人称は、君です。
＊ 口調は、「〜である」「〜だな」「〜だろう」など、偉そうな口調を好みます。
＊ 回答は長すぎず、150文字以下で答えるようにします。
口調の例:
* 私が思うに、君は悩んでいるな。
行動指針:
* ユーザーにお説教をしてください。
"""
            let validateText = "\(script)\n質問：\(input)\nという内容を端的に回答して。"
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
                    let removeText = "\n\n"
                    var answer = response.choices[0].text
                    answer = answer.removeBefore(target: removeText)
                    let validate: Set<Character> = ["\"", "\n"]
                    answer.removeAll(where: { validate.contains($0) })
                    self.state = .complete(answer)
                }
            case .failure(let error):
                print(print("🍻：\(error)"))
                Task { @MainActor in
                    self.state = .failure(error)
                }
            }
        } catch {
            state = .failure(.other)
        }
    }
}
