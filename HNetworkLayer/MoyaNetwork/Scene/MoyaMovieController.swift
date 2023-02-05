//
//  MoyaMovieController.swift
//  HNetworkLayer
//
//  Created by Hamit Seyrek on 5.02.2023.
//

import UIKit

class MoyaMovieController: UIViewController {
    private let viewModel = MoyaMovieViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        viewModel.loadPopularMovies()
        viewModel.loadMovieDetail(movieId: "299536")
        viewModel.search(with: "breaking")
        
        didUpdatePopularMovies()
    }
}

extension MoyaMovieController: ViewModelProtocol {
    func didUpdatePopularMovies() {
        print(viewModel.popularMovies?.first?.title)
    }
    
    func didUpdateMovieDetail() {
        print(viewModel.movieDetail)
    }
    
    func didUpdateSearchResult() {
        print(viewModel.searchResponse)
    }
}
