//
//  UpcomingCollectionViewCell.swift
//  BoxOffice
//
//  Created by Bianca Nathally Bezerra de Lima on 19/07/22.
//

import UIKit

class UpcomingCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "upcomingCell"
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    func setup(title: String, month: String, image: UIImage){
        titleLabel.text = title
        dateLabel.text = month
        imageView.image = image
    }
    
}
