//
//  MainView.swift
//  MovieApp-YZL3401
//
//  Created by Ömer Hattab Saitoğlu on 27.01.2024.
//

import UIKit

final class MainView: UIView, UISearchBarDelegate {
    
    @IBOutlet weak private var searchMovies: UISearchBar!
    @IBOutlet weak private var movieListView: UITableView!
    
    var delegate: MainViewDelegate?
    private var movies: [Movie] = []
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let searchText = searchText
        if searchText.count >= 3 {
            delegate?.load(searchText: searchText)
        }else{
            movies = []
            movieListView.reloadData()
        }
    }
}

extension MainView: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count > 0 ? movies.count : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if movies.count == 0{
            let cell = movieListView.dequeueReusableCell(withIdentifier: "EmptyCell", for: indexPath) as! EmptyTableViewCell
            return cell
        }else{
            let cell = movieListView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieTableViewCell
            cell.configureCell(data: movies[indexPath.row])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectMovie(movie: movies[indexPath.row])
    }
    
}

extension MainView: MainViewProtocol{

    func updateList(model: MovieModel) {
        self.movies = model.results
        self.movieListView.reloadData()
    }
}
