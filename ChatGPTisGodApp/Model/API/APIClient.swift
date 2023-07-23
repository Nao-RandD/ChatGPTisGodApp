//
//  APIClient.swift
//  ChatGPTisGodApp
//
//  Created by Nao RandD on 2023/03/05.
//

import Foundation

enum APIError: Error {
    case responseError
    case decordError
    case urlSessionError
    case apiBusyError
    case other
}

final class APIClient {
    private static let contentType = "application/json"
    private static let decoder: JSONDecoder = {
        return JSONDecoder()
    }()

    static func request<T, V>(_ request: T) async -> Result<V, APIError> where T: BaseRequest,
            V: Decodable,
            T.ResponseType == V {

        var urlRequest = request.asURLRequest()
        urlRequest.setValue("Bearer \(Info.key)", forHTTPHeaderField: "Authorization")
        urlRequest.setValue("application/json", forHTTPHeaderField: "content-type")

        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            if let res = response as? HTTPURLResponse,
               res.statusCode != 200 {
                // 429のステータスコードの場合にはAPIが使用料制限にかかっている
                if res.statusCode == 429 { return .failure(.apiBusyError) }
                return .failure(.responseError)
            }

            guard let responseData = try? decoder.decode(V.self, from: data) else { return .failure(.decordError) }
            return .success(responseData)
        } catch let error {
            print(error.localizedDescription)
            return .failure(.urlSessionError)
        }
    }
}
