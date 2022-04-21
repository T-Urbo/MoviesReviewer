//
//  ViewController.swift
//  MoviesReviewer
//
//  Created by Timothey Urbanovich on 16/04/2022.
//

import UIKit

class ResultsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let blurredView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        blurredView.frame = self.view.bounds
        
    }
}

class ViewController: UIViewController, UISearchResultsUpdating {

    @IBOutlet weak var backgroundImageView: UIImageView!
    
    let searchController = UISearchController(searchResultsController: ResultsViewController())
    // let searchHistory = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setup the ViewController
        
        title = "Search"
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        print(APIRequest)
        let url = "https://imdb-api.com/en/API/SearchMovie/k_rae8rk7s/inception%202010"
        getData(from: url)
//        if let url = URL(string: "https://imdb-api.com/en/API/SearchMovie/k_rae8rk7s/inception%202010") {
//            URLSession.shared.dataTask(with: url) {
//                data, responce, error in
//                if let data = data {
//                    if let jsonString = String(data: data, encoding: .utf8) {
//                            print(jsonString)
//                    }
//                }
//            }.resume()
//        }
        
//        parseJSON(url: url)
        
        
    }

    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        
        print(text)
    }
    
    private func getData(from url: String) {
        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: {data, response, error in
            
            guard let data = data, error == nil else {
                print("Something went wrong")
                return
            }
            
            var result: Response?
            do {
                result = try JSONDecoder().decode(Response.self, from: data)
            }
            catch {
                print(String(describing: error))
            }
            
            guard let json = result else {
                return
            }
            
            print(json.results)
            print(json.expression)
            print(json.searchType)
            json.results.forEach { results in print(results.id)
                print(results.resultType)
                print(results.image)
                print(results.title)
            }
             
//            print(json.results.description)
        })
        
        task.resume()
        
    }
}


