//
//  SearchResponse.swift
//  HNetworkLayer
//
//  Created by Hamit Seyrek on 5.02.2023.
//

struct SearchResponse: Codable {
    let page, totalResults, totalPages: Int?
    let results: [MovieResult]?

    enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results
    }
}
