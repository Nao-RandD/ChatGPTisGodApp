//
//  APICaller.swift
//  ChatGPTisGodApp
//
//  Created by Nao RandD on 2023/03/05.
//

import Foundation
import OpenAISwift

final class APICaller {
    static let shared = APICaller()

    private init() {}

    lazy private var client: OpenAISwift = {
        OpenAISwift(authToken: Content.key)
    }()

    public func getResponse(input: String, )
}
