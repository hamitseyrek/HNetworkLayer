//
//  NetworkError.swift
//  HNetworkLayer
//
//  Created by Hamit Seyrek on 25.01.2023.
//

import Foundation

public enum NetworkError: String, Error {
    
    case parametersNil = "Parameters were nil."
    case encodingFailed = "Parameter encoding Failed."
    case missingURL = "URL is ni.l"
    
}
