//
//  NetworkRequest.swift
//  Movie App
//
//  Created by Rufan Abdurahmanov on 31.05.22.
//
import Alamofire

enum NetworkMethod: String {
    case get = "GET"
    case post = "POST"
}

class NetworkRequest {
    static let shared = NetworkRequest()
    
    func requestAPI<T: Decodable>(type: T.Type, method: NetworkMethod = .get, url: String, params: [String: Any] = [:], completion: @escaping(T)->()) {
        AF.request(url,
                   method: HTTPMethod(rawValue: method.rawValue),
                   parameters: params,
                   encoding: URLEncoding.default,
                   headers: nil,
                   interceptor: nil,
                   requestModifier: nil).responseData { response in
            switch response.result {
            case .success( let value):
                self.parse(value: value) { response in
                    completion(response)
                }
            case .failure(let error):
                print("Network Error: \(error)")
            }
        }
    }
    
    func parse<T: Decodable>(value: Data, completion: @escaping(T)->()) {
        do {
            let jsonData = try JSONDecoder().decode(T.self, from: value)
            completion(jsonData)
        } catch {
            print("Parsing Error: \(error)")
        }
    }
}
