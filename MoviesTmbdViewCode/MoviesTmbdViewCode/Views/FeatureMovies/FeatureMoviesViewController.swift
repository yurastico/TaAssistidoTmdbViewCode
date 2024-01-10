//
//  ViewController.swift
//  MoviesTmbdViewCode
//
//  Created by Yuri Cunha on 07/01/24.
//

import UIKit

class FeatureMoviesViewController: UIViewController {


    
    override func loadView() {
        self.view = FeatureMoviesView()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
            try? await TmdbMoviesCaller().getMovies()
        }
        
        // Do any additional setup after loading the view.
    }
    
}

