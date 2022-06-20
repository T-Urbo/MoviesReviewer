//
//  SearchResultsViewController.swift
//  MoviesReviewer
//
//  Created by Timothey Urbanovich on 27/05/2022.
//

// MARK: Make Results for %result% text label on the top of screen -> DONE!
// TODO: Make refresh with pull gesture
// TODO: Make all posters same size inside of table view cell



import UIKit
import Foundation

class SearchResultsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    
    var numberOfRowsInSection: Int = 0
    var apiKey: String = "f88b8a75"
    var keyWord: String = ""
    
    var imagesURLArray: [String] = [""]
    var titlesArray: [String] = [""]
    var descriptionsArray: [String] = [""]
    var moviesArray = [Movie]()
    
    @IBOutlet weak var tableView: UITableView!
    var scrollView: UIScrollView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        configureScreen()
        
        let searchMovieURL =  "https://www.omdbapi.com/?apikey=\(apiKey)&s=\(keyWord)&type=movie"
        print(searchMovieURL)
        getData(url: searchMovieURL)
    }
    
    
    
        
    func configureScreen() {
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }

    }
    
    private func getData(url: String?) {
        guard let url = url else {
            print("ERROR!")
            let alert = UIAlertController(title: "Alert", message: "Try another title", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in
            
            guard let data = data, error == nil else {
                print("JSON Parsing error!")
                return
            }
            
            self.moviesArray.removeAll()
            
            var movieResults: MovieResults?
            
            do {
                movieResults = try JSONDecoder().decode(MovieResults.self, from: data)
                self.configureScreen()
            }
            catch {
                print(String(describing: error))
            }
            
            guard let finalMovieResults = movieResults else {
                return
            }
            
            let newMovies = finalMovieResults.Search
            self.moviesArray.append(contentsOf: newMovies)
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        })
        task.resume()
    }
}


/* SearchResultsViewController tableView extension */
extension SearchResultsViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.imageView?.layer.cornerRadius = 10
        if (tableView.hasRowAtIndexPath(indexPath: indexPath)) {
            cell.imageView?.kf.setImage(with: URL(string: moviesArray[indexPath.row].Poster!))
            cell.textLabel?.text = moviesArray[indexPath.row].Title
            cell.detailTextLabel?.text = moviesArray[indexPath.row].Year
        }
        else {
            cell.textLabel?.text = "Error"
            cell.detailTextLabel?.text = "Error"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let moviepagevc = storyboard?.instantiateViewController(identifier: "moviepagevc") as? MoviePageViewController {
                    print("moviepagevc was downloaded")
            
            moviepagevc.movieName = moviesArray[indexPath.row].Title
            moviepagevc.imageURL = moviesArray[indexPath.row].Poster!
            
            self.navigationController?.pushViewController(moviepagevc, animated: true)
        
        }
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

}

extension UITableView {
    func hasRowAtIndexPath(indexPath: IndexPath) -> Bool {
        return indexPath.section < self.numberOfSections && indexPath.row < self.numberOfRows(inSection: indexPath.section)
    }
}
