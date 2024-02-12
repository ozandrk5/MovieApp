//
//  MovieTableViewCell.swift
//  MovieApp-YZL3401
//
//  Created by Ömer Hattab Saitoğlu on 28.01.2024.
//

import UIKit
import SDWebImage

final class MovieTableViewCell: UITableViewCell {
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieVote: UILabel!
    @IBOutlet weak var movieDate: UILabel!
    
    func configureCell(data: Movie){
        movieImage.sd_setImage(with: URL(string: data.posterImage ?? ""))
        movieImage.layer.cornerRadius = 15
        movieTitle.text = data.title
        movieVote.text = data.voteAverage?.description
        movieDate.text = data.date
    }
    }

