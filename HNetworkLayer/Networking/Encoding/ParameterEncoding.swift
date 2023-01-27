//
//  ParameterEncoding.swift
//  HNetworkLayer
//
//  Created by Hamit Seyrek on 25.01.2023.
//

import Foundation

public typealias Parameters = [String:Any]

public protocol ParameterEncoder {
    static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
}
