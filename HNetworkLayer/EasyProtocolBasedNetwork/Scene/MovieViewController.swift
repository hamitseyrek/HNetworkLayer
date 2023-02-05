//
//  MovieViewController.swift
//  HNetworkLayer
//
//  Created by Hamit Seyrek on 27.01.2023.
//

import UIKit

class MovieViewController: UIViewController {
    
    var services: MovieServices!
    
    init(services: MovieServices) {
        super.init(nibName: nil, bundle: nil)
        self.services = services
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .green
        services.getNewMovies(page: 1) { movies, error in
            print("***** m", movies?.count, movies?.first?.title)
        }
        
    }

}
