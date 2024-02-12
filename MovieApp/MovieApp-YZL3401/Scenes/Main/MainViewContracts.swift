//
//  MainViewContracts.swift
//  MovieApp-YZL3401
//
//  Created by Ömer Hattab Saitoğlu on 28.01.2024.
//

import Foundation

protocol MainViewProtocol{
    func updateList(model: MovieModel)
}

protocol MainViewDelegate{
    func load(searchText: String)
    func didSelectMovie(movie: Movie)
}

