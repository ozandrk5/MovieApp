//
//  DetailViewController.swift
//  MovieApp-YZL3401
//
//  Created by Ömer Hattab Saitoğlu on 28.01.2024.
//

import UIKit

final class DetailViewController: UIViewController {
    
    @IBOutlet private var detailView: DetailView!
    var movie: Movie?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let movie = movie{
            detailView.updateDetail(movie: movie)
        }
        
    }

}
