//
//  BaseRequest.swift
//  ChatGPTisGodApp
//
//  Created by Nao RandD on 2023/03/05.
//

import Foundation

protocol BaseRequest {
    associatedtype ResponseType

    var method: String { get }
    var baseURL: URL { get }
    var path: String { get }
    var data: Data? { get }
}

extension BaseRequest {
    var baseURL: URL {
        return URL(string: "https://api.openai.com")!
    }

    func asURLRequest() -> URLRequest {
        var urlRequest = URLRequest(url: baseURL.appendingPathComponent(self.path))
        urlRequest.httpMethod = self.method
        if let data = self.data {
            urlRequest.httpBody = data
        }
        return urlRequest
    }
}
