//
//  TmdbMoviesCaller.swift
//  MoviesTmbdViewCode
//
//  Created by Yuri Cunha on 09/01/24.
//

import Foundation

struct TmdbMoviesCaller {
    let baseURL = "https://api.themoviedb.org/3/"
    func getMovies() async throws {
        let headers = [
          "accept": "application/json",
          "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyZTM1NmY2MzY1YmRiMzhlZjYwMmI0ZTFjYzJkOWFmZCIsInN1YiI6IjY1OWQ5ODMyMWQzNTYzMDA5NWQ2YTZmYiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.P-XHQxkbsZGcw-HA_k8pgM5z0mEG9-4vi9hx5p_zd3c"
        ]
        
        guard let url = URL(string: baseURL + "movie/popular?language=en-US&page=1") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        let (data, response) = try await URLSession.shared.data(for: request)
        
        let movies = try JSONDecoder().decode([Movie].self, from: data)
        print(movies)
        
        
    }
}
