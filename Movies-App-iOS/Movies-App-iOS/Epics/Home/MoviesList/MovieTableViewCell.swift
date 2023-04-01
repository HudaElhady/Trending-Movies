//
//  MovieTableViewCell.swift
//  Movies-App-iOS
//
//  Created by huda elhady on 26/07/2021.
//

import UIKit
import SDWebImage

class MovieTableViewCell: UITableViewCell {
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
   
    static let identifier = "MovieTableViewCell"

}

extension MovieTableViewCell: MovieCellProtocol {
    func setMovie(title: String, image: String) {
        movieTitleLabel.text = title
        movieImageView.sd_setImage(with: URL(string: image)!)
    }
}
