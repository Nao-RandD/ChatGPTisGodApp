//
//  OpenAICompletion.swift
//  ChatGPTisGodApp
//
//  Created by Nao RandD on 2023/03/05.
//

import Foundation

//public struct OpenAI: Codable {
//    public let object: String
//    public let model: String?
//    public let choices: [Choice]
//}
//
//public struct Choice: Codable {
//    public let text: String
//}


struct OpenAICompletion: Decodable {
    struct Coice: Decodable {
        var text: String
        var index: Int
        var logprobs: String?
        var finishReason: String

        enum CodingKeys: String, CodingKey {
            case text
            case index
            case logprobs
            case finishReason = "finish_reason"
        }
    }

    struct Usage: Decodable {
        let promptTokens: Int
        let completionTokens: Int
        let totalTokens: Int

        enum CodingKeys: String, CodingKey {
            case promptTokens = "prompt_tokens"
            case completionTokens = "completion_tokens"
            case totalTokens = "total_tokens"
        }
    }

    let choices: [Coice]
    let usage: Usage
}

struct OpenAICompletionRequestData: Codable {
    let model: String
    let prompt: String
    let maxTokens: Int
    let temperature: Int

    enum CodingKeys: String, CodingKey {
        case model
        case prompt
        case maxTokens = "max_tokens"
        case temperature
    }
}
