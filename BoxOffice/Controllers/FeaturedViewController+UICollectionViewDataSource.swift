//
//  FeaturedViewController+UICollectionViewDataSource.swift
//  BoxOffice
//
//  Created by Bianca Nathally Bezerra de Lima on 12/07/22.
//

import UIKit

extension FeaturedViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == self.popularCollectionView{
            return popularMovies.count
            //<.count> diz pra colocar na collection view a quantidade que tem de itens
            
        } else if collectionView == self.nowPlayingCollectionView {
            return nowPlayingMovies.count
            
        } else if collectionView == self.upcomingCollectionView {
            return upcomingMovies.count
            
        } else {
            return 0
        }
        
    }
    //pega do modelo para a view
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == popularCollectionView{
            return makePopularCell(indexPath)
            
        } else if collectionView == nowPlayingCollectionView{
            return makeNowPlayingCell(indexPath)
            
        } else if collectionView == upcomingCollectionView{
            return makeUpcomingCell(indexPath)
        
        } else {
            return UICollectionViewCell()
        }
    }
    
    fileprivate func makePopularCell(_ indexPath: IndexPath) -> PopularCollectionViewCell {
        let cell = popularCollectionView.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewCell.cellIdentifier, for: indexPath) as? PopularCollectionViewCell
        
        let movie = popularMovies[indexPath.item]
        
        cell?.setup(title: popularMovies[indexPath.item].title, image: UIImage(named: popularMovies[indexPath.item].backdropPath) ?? UIImage())
        
        Task {
            let imageData = await
            Movie.downloadImageData(withPath: movie.backdropPath)
            let imagem: UIImage = UIImage(data: imageData) ?? UIImage()
            cell?.setup(title: movie.title,
                        image: imagem)
        }
        
        /*cell?.titleLabel.text = popularMovies[indexPath.item].title
         //<index.Path> acessa todos os filmes
         //<.title> diz o que quer do conjunto de informações do filme
         cell?.imageView.image = UIImage(named: popularMovies[indexPath.item].backdrop)*/
        
        return cell ?? PopularCollectionViewCell()
    }
    
    fileprivate func makeNowPlayingCell(_ indexPath: IndexPath) -> NowPlayingCollectionViewCell {
        let cell = nowPlayingCollectionView.dequeueReusableCell(withReuseIdentifier: NowPlayingCollectionViewCell.cellIdentifier, for: indexPath) as? NowPlayingCollectionViewCell
        
        let year: String = String(nowPlayingMovies[indexPath.item].releaseDate.prefix(4))
        
        cell?.setup(title: nowPlayingMovies[indexPath.item].title,
                    year: year,
                    image: UIImage(named: nowPlayingMovies[indexPath.item].posterPath) ?? UIImage())
        
        /*cell?.titleLabel.text = nowPlayingMovies[indexPath.item].title
         let year: String = String(nowPlayingMovies[indexPath.item].releaseDate.prefix(4))
         //ou interpolação de Strings: <"\(nowPlayingMovies[indexPath.item].releaseDate.prefix(4))">
         cell?.dateLabel.text = year
         cell?.imageView.image = UIImage(named: nowPlayingMovies[indexPath.item].poster)*/
        
        return cell ?? NowPlayingCollectionViewCell()
    }
    
    fileprivate func makeUpcomingCell(_ indexPath: IndexPath) -> UpcomingCollectionViewCell {
        let cell = upcomingCollectionView.dequeueReusableCell(withReuseIdentifier: UpcomingCollectionViewCell.cellIdentifier, for: indexPath) as? UpcomingCollectionViewCell
        
        let month: String = String(nowPlayingMovies[indexPath.item].releaseDate.prefix(4))
        
        cell?.setup(title: upcomingMovies[indexPath.item].title,
                    month: month,
                    image: UIImage(named: nowPlayingMovies[indexPath.item].posterPath) ?? UIImage())
        
        return cell ?? UpcomingCollectionViewCell()
    }
    
}
