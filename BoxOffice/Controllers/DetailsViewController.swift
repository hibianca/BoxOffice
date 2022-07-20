//
//  DetailsViewController.swift
//  BoxOffice
//
//  Created by Bianca Nathally Bezerra de Lima on 18/07/22.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet var backdropImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var posterImage: UIImageView!
    @IBOutlet var ratingLabel: UILabel!
    
    @IBOutlet var overviewLabel: UILabel!
    
    var movie: Movie?
    // <?> significa que é opcional
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let movie = movie else {
            return
        }
        
        title = movie.title
        //propriedade de título
        
        backdropImage.image = UIImage(named: movie.backdropPath)
        titleLabel.text = movie.title
        
        posterImage.image = UIImage(named: movie.posterPath)
        ratingLabel.text = "Rating: \(movie.voteAverage)/10"
        
        overviewLabel.text = movie.overview
        
        Task {
            let imageDataBackdrop = await Movie.downloadImageData(withPath: movie.backdropPath)
            let imageDataPoster = await Movie.downloadImageData(withPath: movie.posterPath)
            let imageBackdrop: UIImage = UIImage(data: imageDataBackdrop) ?? UIImage()
            let imagePoster: UIImage = UIImage(data: imageDataPoster) ?? UIImage()
            backdropImage.image = imageBackdrop
            posterImage.image = imagePoster
            
        }
        
    }
    
}
