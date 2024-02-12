//
//  ServiceProtocol.swift
//  MovieApp-YZL3401
//
//  Created by Ömer Hattab Saitoğlu on 21.01.2024.
//

import Foundation
import Alamofire

protocol ServiceProtocol{
    func fetchMovies(paramaters: [String: String]?, completion: @escaping((Results<MovieModel>)) -> ())
}



