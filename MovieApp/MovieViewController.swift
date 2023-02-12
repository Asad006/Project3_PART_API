//
//  ViewController.swift
//  MovieApp
//
//  Created by Asad mero on 2/2/23.
//

import UIKit

class MovieViewController: UIViewController, UITableViewDataSource {
    

   //Outlets
    @IBOutlet weak var movieTableView: UITableView!
    
    //data array
    var movies: [Movie] = []
    
    //DId load
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        ////
        
        // Create a URL for the request
        // In this case, the custom search URL you created in in part 1
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=80a7b243e1df59dd52b50d85d45f8907&language=en-US&page=1")!

        // Use the URL to instantiate a request
        let request = URLRequest(url: url)

        // Create a URLSession using a shared instance and call its dataTask method
        // The data task method attempts to retrieve the contents of a URL based on the specified URL.
        // When finished, it calls it's completion handler (closure) passing in optional values for data (the data we want to fetch), response (info about the response like status code) and error (if the request was unsuccessful)
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
                    self?.movies = response.results

                    // Make the table view reload now that we have new data
                    self?.movieTableView.reloadData()
                }

            } catch {
                print("❌ Error parsing JSON: \(error.localizedDescription)")
            }
        }

        // Initiate the network request
        task.resume()


        ///
        //movies = Movie.mockMovies
        
        movieTableView.dataSource=self
        
        // Fetch data from the API
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        movies.count
        
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           
            let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell

            // Get the track that corresponds to the table view row
            let movie = movies[indexPath.row]

            // Configure the cell with it's associated track
            cell.setCellElements(with: movie)

            // return the cell for display in the table view
            return cell
        }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        
        // Get the cell that triggered the segue
        if let cell = sender as? UITableViewCell,
           // Get the index path of the cell from the table view
           let indexPath = movieTableView.indexPath(for: cell),
           // Get the detail view controller
           let detailViewController = segue.destination as? DetailViewController {
            
            // Use the index path to get the associated track
            let movie = movies[indexPath.row]
            
            // Set the track on the detail view controller
            detailViewController.movie = movie
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let indexPath = movieTableView.indexPathForSelectedRow {
            
            // Deselect the row at the corresponding index path
            movieTableView.deselectRow(at: indexPath, animated: true)
        }
    }


    
}

