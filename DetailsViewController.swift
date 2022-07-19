//
//  DetailsViewController.swift
//  BoxOffice
//
//  Created by Bianca Nathally Bezerra de Lima on 14/07/22.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet var backdropImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var posterImage: UIImageView!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var overviewLabel: UILabel!
    
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        print(movie)
        self.title = movie?.title
        
        guard let movie = movie else {
            return
        }
        
        title = movie.title
        backdropImage.image = UIImage(named: movie.backdrop)
        titleLabel.text = movie.title
        //elemento . o que quer modificar = de onde vai receber
        posterImage.image = UIImage(named: movie.poster)
        ratingLabel.text = "\(movie.voteAverage)/10"
        //se não colocar as aspas duplas <"">, a barra <\> e os parênteses <()>, ele vai reclamar por ser um float (voteAverage). Ele só aceita string, então dessa forma pode-se tornar o float uma string.
        overviewLabel.text = movie.overview
        
    }

}
