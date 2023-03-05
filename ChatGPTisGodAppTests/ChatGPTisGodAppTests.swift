//
//  ChatGPTisGodAppTests.swift
//  ChatGPTisGodAppTests
//
//  Created by Nao RandD on 2023/03/05.
//

import XCTest
@testable import ChatGPTisGodApp

final class ChatGPTisGodAppTests: XCTestCase {
    func testExample() async throws {
        let body = OpenAICompletionRequestData(model: "text-davinci-003",
                                               prompt: "Give me random emoji",
                                               maxTokens: 7,
                                               temperature: 0)
        let encoder = JSONEncoder()
        let data = try encoder.encode(body)
        let request = OpenAIRequest(data: data)
        let result = await APIClient.request(request)

        switch result {
        case .success(let response):
            print(response)
            XCTAssertEqual(true, true)
        case .failure(let error):
            print(error)
            XCTAssertEqual(true, false)
        }
    }

    func testDecord() throws {
        let json = """
{
    "id":"cmpl-6qga0wwBlXj3U6LffQ6G32TrJq6kI",
    "object":"text_completion",
    "created":1678014752,
    "model":"text-davinci-003",
    "choices":[{
            "text":"\n\n😊",
            "index":0,
            "logprobs":null,
            "finish_reason":"stop"
        }],
    "usage":{
        "prompt_tokens":4,
        "completion_tokens":4,
        "total_tokens":8
        }
}
""".data(using: .utf8)!
        let decoder = JSONDecoder()
        let openAICompletion = try decoder.decode(OpenAICompletion.self, from: json)
        XCTAssertEqual(0, openAICompletion.choices[0].index)
    }
}
