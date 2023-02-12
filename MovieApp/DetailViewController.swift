//
//  DetailViewController.swift
//  MovieApp
//
//  Created by Asad mero on 2/2/23.
//

import UIKit
import Nuke

class DetailViewController: UIViewController {

    //model data
    var movie: Movie!
    
    @IBOutlet weak var movieImageView: UIImageView!
   
    @IBOutlet weak var ratingLabel: UILabel!
   
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var popularityLabel: UILabel!
    //Outlets
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let api = "https:/image.tmdb.org/t/p/original"
        let endpoint = movie.poster_path.absoluteString
        let url = URL(string:api + endpoint)
       
        // Do any additional setup after loading the view.
        Nuke.loadImage(with: url!, into: movieImageView)
        descriptionLabel.text = movie.overview
        popularityLabel.text = "Popularity: " + movie.popularity.description
        ratingLabel.text = "Average Vote: " + movie.vote_average.description
        dateLabel.text =  movie.vote_count.description + " Votes"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
