//
//  FeaturedViewController+UICollectionViewDelegate.swift
//  BoxOffice
//
//  Created by Bianca Nathally Bezerra de Lima on 18/07/22.
//

import UIKit

extension FeaturedViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //<didSelectItem> para identificar que o usuário tocou em algum item

        let movie: Movie
        //declara movie
        
        if collectionView == popularCollectionView {
            movie = popularMovies[indexPath.item]
            //passa o valor de movie | inicialização do valor da variável
            //o item do array vai ser aquele que o indexPath tá pedindo ou indicando
        } else {
            movie = nowPlayingMovies[indexPath.item]
        }
        self.performSegue(withIdentifier: "detailsSegue", sender: movie)
    }
    
}
