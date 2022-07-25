//
//  TrendingTableViewCell.swift
//  BoxOffice
//
//  Created by Bianca Nathally Bezerra de Lima on 24/07/22.
//

import UIKit

class TrendingTableViewCell: UITableViewCell {
    
    static let cellIdentifier = "trendingCell"
    
    @IBOutlet var imageViewTrending: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    func setup(title: String, image: UIImage, year: String){
    imageViewTrending.image = image
    titleLabel.text = title
    dateLabel.text = year
    }
}
