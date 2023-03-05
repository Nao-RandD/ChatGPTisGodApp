//
//  OpenAIRequest.swift
//  ChatGPTisGodApp
//
//  Created by Nao RandD on 2023/03/05.
//

import Foundation

struct OpenAIRequest: BaseRequest {
    typealias ResponseType = OpenAICompletion

    var method: String {
        "POST"
    }

    var path: String {
        "/v1/completions"
    }

    var data: Data?

    init(data: Data? = nil) {
        self.data = data
    }
}
