//
//  MovieModel.swift
//  MovieApp-YZL3401
//
//  Created by Ömer Hattab Saitoğlu on 21.01.2024.
//

import Foundation

struct MovieModel: Decodable{
    let results: [Movie]
}

struct Movie: Decodable{
    let title, overview: String?
    let voteAverage: Double?
    let posterPath: String?
    let date: String?
    var posterImage: String?{
        return "\(ServiceEndPoint.imageURL)\(posterPath ?? "")"
    }
    
    enum CodingKeys: String, CodingKey {
        case title
        case overview
        case voteAverage = "vote_average"
        case posterPath = "poster_path"
        case date = "release_date"
    }
}

