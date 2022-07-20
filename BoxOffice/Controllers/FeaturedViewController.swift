//
//  FeaturedViewController.swift
//  BoxOffice
//
//  Created by Bianca Nathally Bezerra de Lima on 04/07/22.
//

import UIKit

class FeaturedViewController: UIViewController {
    
    var popularMovies: [Movie] = [] //Movie.popularMovies()
    let nowPlayingMovies = Movie.nowPlayingMovies()
    let upcomingMovies = Movie.upcomingMovies()
    
    @IBOutlet weak var popularCollectionView: UICollectionView!
    @IBOutlet weak var nowPlayingCollectionView: UICollectionView!
    //acesso para as views
    @IBOutlet var upcomingCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popularCollectionView.dataSource = self
        popularCollectionView.delegate = self
        
        nowPlayingCollectionView.dataSource = self
        nowPlayingCollectionView.delegate = self
        
        upcomingCollectionView.dataSource = self
        upcomingCollectionView.delegate = self
        
        Task {
            popularMovies = await Movie.popularMoviesAPI()
            self.popularCollectionView.reloadData()
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailsViewController {
            //primeiro tem que identificar qual segue, o destino.
            //if sempre acompanha um par de chaves
            let movie = sender as? Movie
            destination.movie = movie
            //sender considera sendo do tipo <Movie>
        }
    }
    //controlador sendo responsável para fazer a mudança de tela
    
}
