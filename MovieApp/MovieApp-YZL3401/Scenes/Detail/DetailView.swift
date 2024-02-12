//
//  DetailView.swift
//  MovieApp-YZL3401
//
//  Created by Ömer Hattab Saitoğlu on 28.01.2024.
//

import UIKit
import SDWebImage

final class DetailView: UIView{
    @IBOutlet weak private var detailImage: UIImageView!
    @IBOutlet weak private var imdb: UILabel!
    @IBOutlet weak private var date: UILabel!
    @IBOutlet weak private var detailTitle: UILabel!
    @IBOutlet weak private var detailOverview: UILabel!
    
   /* let dateFormatter = DateFormatter()
    func dateFormatter.dateFormat = "dd.MM.yyyy"
    let date = date
    func label.text = dateFormatter.string(from: date) */
}
extension DetailView: DetailViewProtocol{
    func updateDetail(movie: Movie) {
        detailImage.sd_setImage(with: URL(string: movie.posterImage ?? ""))
        imdb.text = movie.voteAverage?.description
        date.text = movie.date
        detailTitle.text = movie.title
        detailOverview.text = movie.overview
    }
}
