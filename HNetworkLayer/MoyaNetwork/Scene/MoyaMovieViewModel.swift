//
//  MoyaMovieViewModel.swift
//  HNetworkLayer
//
//  Created by Hamit Seyrek on 5.02.2023.
//

import Foundation

protocol ViewModelProtocol: class {
    func didUpdatePopularMovies()
    func didUpdateMovieDetail()
    func didUpdateSearchResult()
}

class MoyaMovieViewModel {
    
    weak var delegate: ViewModelProtocol?
    
    fileprivate(set) var popularMovies: [MovieResult]? = []
    fileprivate(set) var movieDetail: MovieDetailResponse?
    fileprivate(set) var searchResponse: SearchResponse?
    
    private let networkManager: MoyaNetworkManager
    
    init(networkManager: MoyaNetworkManager = MoyaNetworkManager()) {
        self.networkManager = networkManager
    }
    
    func loadPopularMovies() {
        networkManager.fetchPopularMovies { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let movieResponse):
                if let popularMovies = movieResponse.results {
                    strongSelf.popularMovies = popularMovies
                    strongSelf.delegate?.didUpdatePopularMovies()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func loadMovieDetail(movieId: String) {
        networkManager.fetchMovieDetail(movieId: movieId, completion: { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let movieDetailResponse):
                strongSelf.movieDetail = movieDetailResponse
                strongSelf.delegate?.didUpdateMovieDetail()
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
    
    func search(with query: String) {
        networkManager.fetchSearchResult(query: query, completion: { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let searchResponse):
                strongSelf.searchResponse = searchResponse
                strongSelf.delegate?.didUpdateSearchResult()
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
}
