//
//  EndPointType.swift
//  HNetworkLayer
//
//  Created by Hamit Seyrek on 25.01.2023.
//

import Foundation

protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: MyHTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
}
