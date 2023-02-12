//
//  PosterViewController.swift
//  MovieApp
//
//  Created by Asad mero on 2/9/23.
//

import UIKit
import Nuke

class PosterViewController: UIViewController, UICollectionViewDataSource {
   
    //data array
    var posters: [Movie] = []
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                // Do any additional setup after loading the view.
        // Create a URL for the request
        // In this case, the custom search URL you created in in part 1
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=80a7b243e1df59dd52b50d85d45f8907&language=en-US&page=1")!

        // Use the URL to instantiate a request
        let request = URLRequest(url: url)

       
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in

            // Handle any errors
            if let error = error {
                print("❌ Network error: \(error.localizedDescription)")
            }

            // Make sure we have data
            guard let data = data else {
                print("❌ Data is nil")
                return
            }

            // The `JSONSerialization.jsonObject(with: data)` method is a "throwing" function (meaning it can throw an error) so we wrap it in a `do` `catch`
            // We cast the resultant returned object to a dictionary with a `String` key, `Any` value pair.
            do {
                
                // Create a JSON Decoder
                let decoder = JSONDecoder()
                // Create a date formatter
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"

                decoder.dateDecodingStrategy = .formatted(dateFormatter)
                let response = try decoder.decode(MovieResponse.self, from: data)

                // Access the array of tracks from the `results` property
                //movies =
                //print("✅ \(response.results)")
                DispatchQueue.main.async {

                    // Set the view controller's tracks property as this is the one the table view references
                    self?.posters = response.results

                    // Make the table view reload now that we have new data
                    self?.collectionView.reloadData()
                }

            } catch {
                print("❌ Error parsing JSON: \(error.localizedDescription)")
            }
        }

        // Initiate the network request
        task.resume()
        
        collectionView.dataSource = self
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout

        // The minimum spacing between adjacent cells (left / right, in vertical scrolling collection)
        // Set this to taste.
        layout.minimumInteritemSpacing = 2

        // The minimum spacing between adjacent cells (top / bottom, in vertical scrolling collection)
        // Set this to taste.
        layout.minimumLineSpacing = 2

        // Set this to however many columns you want to show in the collection.
        let numberOfColumns: CGFloat = 3

        // Calculate the width each cell need to be to fit the number of columns, taking into account the spacing between cells.
        let width = (collectionView.bounds.width - layout.minimumInteritemSpacing * (numberOfColumns - 1)) / numberOfColumns

        // Set the size that each tem/cell should display at
        layout.itemSize = CGSize(width: width, height: width)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        posters.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PosterCell", for: indexPath) as! PosterCell
            
                // Use the indexPath.item to index into the albums array to get the corresponding album
                let poster = posters[indexPath.item]

                // Get the artwork image url
            let imageUrl = poster.poster_path.absoluteString
                let api = "https:/image.tmdb.org/t/p/original"
                
                let url = URL(string:api + imageUrl)

                // Set the image on the image view of the cell
                Nuke.loadImage(with: url!, into: cell.posterImageView)
              
            let indexPath = self.collectionView.indexPath(for: cell)
             
                return cell
        }
        

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        
        // Get the cell that triggered the segue
        if let cell = sender as? UICollectionViewCell,
           // Get the index path of the cell from the table view
        let indexPath = self.collectionView.indexPath(for: cell),
        
           // Get the detail view controller
           let detailViewController = segue.destination as? DetailViewController {
            
            // Use the index path to get the associated track
            let movie = posters[indexPath.row]
            
            // Set the track on the detail view controller
            detailViewController.movie = movie
       }
    }
    
    
}
