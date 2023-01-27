//
//  HTTPTask.swift
//  HNetworkLayer
//
//  Created by Hamit Seyrek on 25.01.2023.
//

import Foundation

public enum HTTPTask {
    
    case request
    case requestParameters(bodyParameters: Parameters?, urlParameters: Parameters?)
    case requestParametersndHeaders(bodyParameters: Parameters?, urlParameters: Parameters?, additionHeaders: HTTPHeaders?)
    
    // case download, upload, etc...
}
