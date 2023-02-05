//
//  NetworkManager.swift
//  HNetworkLayer
//
//  Created by Hamit Seyrek on 27.01.2023.
//

import Foundation

enum NetworkResponse:String {
    case success
    case authenticationError = "You need to be authenticated first."
    case badRequest = "Bad request"
    case outdated = "The url you requested is outdated."
    case failed = "Network request failed."
    case noData = "Response returned with no data to decode."
    case unableToDecode = "We could not decode the response."
}

enum MyResult<String>{
    case success
    case failure(String)
}

struct MyNetworkManager {
    
    static let environment : NetworkEnvironment = .production
    static let MovieAPIKey = "7e5c91391397f95eb1d23124a14bd6a7"

    static func handleNetworkResponse(_ response: HTTPURLResponse) -> MyResult<String>{
        switch response.statusCode {
        case 200...299: return .success
        case 401...500: return .failure(NetworkResponse.authenticationError.rawValue)
        case 501...599: return .failure(NetworkResponse.badRequest.rawValue)
        case 600: return .failure(NetworkResponse.outdated.rawValue)
        default: return .failure(NetworkResponse.failed.rawValue)
        }
    }
}
