//
//  ViewController.swift
//  MoviesReviewer
//
//  Created by Timothey Urbanovich on 16/04/2022.
//



import UIKit
import Kingfisher

class ViewController: UIViewController, UISearchBarDelegate, UISearchControllerDelegate, UISearchResultsUpdating, UINavigationControllerDelegate {

    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    public var movieNameToSegue: String = ""
    public var completionHandler: ((String?) -> Void)?
    
//    var dataSendDelegate: SendDataToMoviePageVC?
    
    var movieSearchPosterURL = URL(string: "")
    var moviesSearchArray = [Response]()
    
    
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let moviePageViewController = segue.destination as! MoviePageViewController
        
        moviePageViewController.movieName = movieNameToSegue
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSearchBar()
        print(APIRequest)
        
    }
    
    func configureSearchBar() {
//        searchBar.placeholder = "test"
//        navigationController?.delegate = self
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        searchController.delegate = self
        searchController.searchBar.delegate = self
//        self.searchBar.delegate = self
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }

        print(text)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("test")

        if let searchresultsvc = storyboard?.instantiateViewController(identifier: "searchresultsvc") as? SearchResultsViewController {
            
            print("good!")
            
            guard let movieName = searchBar.text else {
                print("<<<<Input field is empty!>>>>")
                return
            }
            
            searchresultsvc.movieName = movieName
            
            self.navigationController?.pushViewController(searchresultsvc, animated: true)
            
        }
    }



}

protocol SendDataToMoviePageVC {
    func sendData()
}
