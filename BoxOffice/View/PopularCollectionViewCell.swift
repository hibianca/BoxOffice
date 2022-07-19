//
//  PopularCollectionViewCell.swift
//  BoxOffice
//
//  Created by Bianca Nathally Bezerra de Lima on 12/07/22.
//

import UIKit

class PopularCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "popularCell"
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    func setup(title: String, image: UIImage){
        titleLabel.text = title
        //pega a informação que tá recebendo e joga pra UILabel dela
        imageView.image = image
        //pega a imagem e coloca na imageView
        //ela tem a responsabilidade de se construir (continua burra a bichinha)
    }
    
}
