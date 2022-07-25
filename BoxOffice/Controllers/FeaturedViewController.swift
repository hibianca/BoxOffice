//
//  FeaturedViewController.swift
//  BoxOffice
//
//  Created by Bianca Nathally Bezerra de Lima on 04/07/22.
//

import UIKit

class FeaturedViewController: UIViewController {
    
    var popularMovies: [Movie] = [] //Movie.popularMovies()
    var nowPlayingMovies = Movie.nowPlayingMovies()
    var upcomingMovies = Movie.upcomingMovies()
    
    @IBOutlet weak var popularCollectionView: UICollectionView!
    @IBOutlet weak var nowPlayingCollectionView: UICollectionView!
    //acesso para as views
    @IBOutlet var upcomingCollectionView: UICollectionView!
    
    
    @IBOutlet var popularSeeAll: UIButton!
    @IBOutlet var nowPlayingSeeAll: UIButton!
    @IBOutlet var upcomingSeeAll: UIButton!
    
    
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
        
        Task {
            nowPlayingMovies = await Movie.nowPlayingMoviesAPI()
            self.nowPlayingCollectionView.reloadData()
        }
        
        Task {
            upcomingMovies = await Movie.upcomingMoviesAPI()
            self.upcomingCollectionView.reloadData()
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailsViewController {
            //primeiro tem que identificar qual segue, o destino.
            //if sempre acompanha um par de chaves
            let movie = sender as? Movie
            destination.movie = movie
            //sender considera sendo do tipo <Movie>
            
        } else if let destination = segue.destination as? SeeAllViewController,
                  let button = sender as? UIButton{
            if button == popularSeeAll{
                destination.movies = popularMovies
                destination.title = "Popular"
            } else if button == nowPlayingSeeAll{
                destination.movies = nowPlayingMovies
                destination.title = "Now Playing"
            } else{
                destination.movies = upcomingMovies
                destination.title = "Upcoming"
            }
        }
    }
    //controlador sendo responsável para fazer a mudança de tela
    
}
