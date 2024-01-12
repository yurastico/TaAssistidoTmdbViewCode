//
//  ViewController.swift
//  MoviesTmbdViewCode
//
//  Created by Yuri Cunha on 07/01/24.
//

import UIKit

class FeatureMoviesViewController: UIViewController {

    var movies: [Movie] = []
    var moviesView: FeatureMoviesView?
    override func loadView() {
        self.moviesView = FeatureMoviesView()
        self.view = moviesView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
            do {
                movies = try await TmdbMoviesCaller().getMovies()
                moviesView?.loadMovies(movies)
                moviesView?.moviesCollection.reloadData()
            } catch {
                print(error)
            }
        }
        
        // Do any additional setup after loading the view.
    }
    
}




