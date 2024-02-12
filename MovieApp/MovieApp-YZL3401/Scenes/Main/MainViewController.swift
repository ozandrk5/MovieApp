//
//  ViewController.swift
//  MovieApp-YZL3401
//
//  Created by Ömer Hattab Saitoğlu on 21.01.2024.
//

import UIKit

final class MainViewController: UIViewController {
    

    @IBOutlet private var mainView: MainView!
    var service = ServiceManager()
    
    @IBOutlet weak var favoriButton: UIButton!
    var isFavorite: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        mainView.delegate = self
        
        }
    @IBAction func favoriteButton(_ sender: UIButton) {
    favoriButton.backgroundColor = UIColor.yellow
     
        
        let imageName = !isFavorite ? "heart_filled" : "heart_empty"
        let image = UIImage(named: imageName)
    favoriButton.setImage(image, for: .normal)
    }
}


extension MainViewController: MainViewDelegate{
    func load(searchText: String) {
        service.fetchMovies(paramaters: ["query": searchText]) { [weak self] (response) in
            switch response{
            case .success(let data):
                self?.mainView.updateList(model: data)
            case .error(let error):
                print("Hata : ", error)
            }
        }
    }
    
    func didSelectMovie(movie: Movie) {
        let storyboard = UIStoryboard(name: "Detail", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetailVC") as! DetailViewController
        vc.movie = movie
        show(vc, sender: nil)
    }
}
