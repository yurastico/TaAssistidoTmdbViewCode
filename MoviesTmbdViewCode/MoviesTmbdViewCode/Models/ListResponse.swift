//
//  ListResponse.swift
//  MoviesTmbdViewCode
//
//  Created by Yuri Cunha on 10/01/24.
//

import Foundation

struct ListResponse<T>: Codable {
    let page: Int
    let results: [Movie]
}
