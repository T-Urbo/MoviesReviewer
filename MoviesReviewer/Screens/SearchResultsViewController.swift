//
//  SearchResultsViewController.swift
//  MoviesReviewer
//
//  Created by Timothey Urbanovich on 27/05/2022.
//

// MARK: Make Results for %result% text label on the top of screen


import UIKit
import Foundation

class SearchResultsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var numberOfRowsInSection: Int = 0
    var imdbAPIKey: String = "k_rae8rk7s"
    var movieName: String = ""
    
    var movieSearchResponse = Response()
    var imagesURLArray: [String] = [""]
    var titlesArray: [String] = [""]
    var descriptionsArray: [String] = [""]
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ArraysTest:")
        for images in imagesURLArray {
            print(images)
        }

        tableView.delegate = self
        tableView.dataSource = self
        
        print(numberOfRowsInSection)
        var searchMovieURL =  "https://imdb-api.com/en/API/SearchMovie/\(imdbAPIKey)/\(movieName)"
        getData(url: searchMovieURL)
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if(!indexPath.isEmpty) {
//            if !imagesURLArray[indexPath.row].isEmpty {
//                cell.imageView?.kf.setImage(with: URL(string: imagesURLArray[indexPath.row]))
//            }
            
            cell.imageView?.layer.cornerRadius = 10

            cell.textLabel?.text = titlesArray[indexPath.row]
            cell.detailTextLabel?.text = descriptionsArray[indexPath.row]
        }
        else {
            
        }
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("row was selected!")
        
        if let moviepagevc = storyboard?.instantiateViewController(identifier: "moviepagevc") as? MoviePageViewController {
                    print("lol")
            moviepagevc.imageURL = imagesURLArray[indexPath.row + 1]
            moviepagevc.movieName = titlesArray[indexPath.row + 1]
            
        self.navigationController?.pushViewController(moviepagevc, animated: true)
        
        }
        self.tableView.reloadData()
    }
    
    func configureScreen() {
       
        numberOfRowsInSection = movieSearchResponse.results.capacity
        print("movieSearchResponse.results.capacity: ", movieSearchResponse.results.capacity)
        print(movieSearchResponse.searchType)
            //print(movieSearchResponse.expression)
        //    print(movieSearchResponse.errorMessage)
        movieSearchResponse.results.forEach { results in
        //  print(results.description)
        //  print(results.id)
        //  print(results.image)
            print(results.title)
        }
        
        movieSearchResponse.results.forEach { results in
            imagesURLArray.append(results.image)
            titlesArray.append(results.title)
            descriptionsArray.append(results.description)
        }
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    private func getData(url: String) -> Response { let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: {data, response, error in
            
            guard let data = data, error == nil else {
                print("Something went wrong")
                return
            }
            
            var result: Response?
            do {
                result = try JSONDecoder().decode(Response.self, from: data)
                self.movieSearchResponse = result!
                self.configureScreen()
            }
            catch {
                print(String(describing: error))
            }
            
            
            
//            let json = result!
            
        
         
        
            
//            print(json.results)
//            print(json.expression)
//            print(json.searchType)
//            json.results.forEach { results in print(results.id)
//                print(results.resultType)
//                print(results.image)
//                print(results.title)
//            }
//
//            print(json.results.description)
//
        })
        
        task.resume()
        
        return movieSearchResponse
    }
    
    
}


