//
//  TmdbMoviesCaller.swift
//  MoviesTmbdViewCode
//
//  Created by Yuri Cunha on 09/01/24.
//

import UIKit

struct TmdbMoviesCaller {
    let baseURL = "https://api.themoviedb.org/3"
    func getMovies() async throws -> [Movie] {
        let headers = [
          "accept": "application/json",
          "Authorization": "tkb"
        ]
        
        guard let url = URL(string: baseURL + "/movie/popular?language=en-US&page=1") else { return [] }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        let (data, _) = try await URLSession.shared.data(for: request)
        let movies = try JSONDecoder().decode(ListResponse<Movie>.self, from: data)
        
        return movies.results
    }
    
    func getImage(for path: String) async -> UIImage? {
        let str = "https://image.tmdb.org/t/p/w500"
        guard let url = URL(string: str + path) else { return nil }
        let headers = [
          "accept": "application/json",
          "Authorization": "tkb"
        ]
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        guard let (data, response) = try? await URLSession.shared.data(for: request) else { return nil}
        print(data)
        guard let image = UIImage(data: data) else { return nil}
        return image
        
    }
    
}
