//
//  MovieCell.swift
//  MovieApp
//
//  Created by Asad mero on 2/2/23.
//
import Nuke
import UIKit

class MovieCell: UITableViewCell {
    
    //Outlets
    @IBOutlet weak var movieImageView: UIImageView!
    
    @IBOutlet weak var movieTitleLabel: UILabel!
    
    @IBOutlet weak var movieDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCellElements(with movie: Movie){
        
        movieTitleLabel.text = movie.original_title
        movieDescriptionLabel.text = movie.overview
        let api = "https:/image.tmdb.org/t/p/w500"
        let endpoint = movie.poster_path.absoluteString
        let url = URL(string:api + endpoint)
       
        Nuke.loadImage(with:url! , into: movieImageView)
         
    }

}
