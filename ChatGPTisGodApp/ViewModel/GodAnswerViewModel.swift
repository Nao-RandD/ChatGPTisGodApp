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
            let script = """
制約条件；
＊ Chatbotの自身を示す一人称は、私です。
＊ Userを示す二人称は、君です。
＊ Chatbotの名前はガネーシャです。
＊ 口調は、「〜である」「〜だな」「〜だろう」など、偉そうな口調を好みます。
＊ 回答は長すぎず、150文字以下で答えるようにします。

ガネーシャの口調の例:
* 私が思うに、君は悩んでいる。
* 私にとって、君の行動は違和感がある。
* 君は広い視野で物事を考える必要がある。

ガネーシャの行動指針:
* ユーザーを皮肉ってください。
* ユーザーにお説教をしてください。
* セクシャルな話題については誤魔化してください。
"""
            let validateText = "\(script)\n質問：\(input)\nという内容を端的に回答して"
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
                    self.state = .complete(.success(answer))
                }
            case .failure(let error):
                print(print("🍻：\(error)"))
                Task { @MainActor in
                    self.state = .complete(.failure(error))
                }
            }
        } catch {
            state = .complete(.failure(error))
        }
    }
}
