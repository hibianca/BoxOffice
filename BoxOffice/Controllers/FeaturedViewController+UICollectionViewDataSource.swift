//
//  FeaturedViewController+UICollectionViewDataSource.swift
//  BoxOffice
//
//  Created by Bianca Nathally Bezerra de Lima on 12/07/22.
//

import UIKit

extension FeaturedViewController{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == self.popularCollectionView{
            return popularMovies.count
            //<.count> diz pra colocar na collection view a quantidade que tem de itens
        
        } else if collectionView == self.nowPlayingCollectionView {
            return nowPlayingMovies.count
        
        } else {
            return 0
        
        }
    }
    
    fileprivate func makePopularCell(_ indexPath: IndexPath) -> UICollectionViewCell {
        let cell = popularCollectionView.dequeueReusableCell(withReuseIdentifier: "popularCell", for: indexPath) as? PopularCollectionViewCell
        
        cell?.titleLabel.text = popularMovies[indexPath.item].title
        //<index.Path> acessa todos os filmes
        //<.title> diz o que quer do conjunto de informações do filme
        cell?.image.image = UIImage(named: popularMovies[indexPath.item].backdrop)
        
        return cell ?? UICollectionViewCell()
    }
    
    fileprivate func makeNowPlayingCell(_ indexPath: IndexPath) -> UICollectionViewCell {
        let cell = nowPlayingCollectionView.dequeueReusableCell(withReuseIdentifier: "nowPlayingCell", for: indexPath) as? NowPlayingCollectionViewCell
        
        cell?.titleLabel.text = nowPlayingMovies[indexPath.item].title
        cell?.dateLabel.text = nowPlayingMovies[indexPath.item].releaseDate
        cell?.image.image = UIImage(named: nowPlayingMovies[indexPath.item].poster)
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.popularCollectionView{
            return makePopularCell(indexPath)
        
        } else if collectionView == self.nowPlayingCollectionView{
            return makeNowPlayingCell(indexPath)
        
        } else {
            return UICollectionViewCell()
            
        }
    }
}
