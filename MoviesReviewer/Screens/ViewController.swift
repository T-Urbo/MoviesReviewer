//
//  ViewController.swift
//  MoviesReviewer
//
//  Created by Timothey Urbanovich on 16/04/2022.
//



import UIKit
import Kingfisher

class ViewController: UIViewController, UISearchBarDelegate, UISearchControllerDelegate, UISearchResultsUpdating, UINavigationControllerDelegate {

    
    public var movieNameToSegue: String = ""
    public var completionHandler: ((String?) -> Void)?
    
    var movieSearchPosterURL = URL(string: "")
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSearchBar()
    }
    
    func configureSearchBar() {
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        searchController.delegate = self
        searchController.searchBar.delegate = self
        
        
        
//        searchController.searchBar.searchTextField.backgroundColor = .white
//        searchController.searchBar.searchTextField.textColor = .black
    
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
            
            guard let movieName = searchBar.text else {
                print("<<<<Input field is empty!>>>>")
                return
            }
            
            searchresultsvc.keyWord = movieName
                        
            self.navigationController?.pushViewController(searchresultsvc, animated: true)
            
        }
    }
    
    public func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.showsScopeBar = true
        searchBar.sizeToFit()
        searchBar.setShowsCancelButton(true, animated: true)
        
        
        return true
    }
    
    public func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.showsScopeBar = false
        searchBar.sizeToFit()
        searchBar.setShowsCancelButton(false, animated: true)
        
        
        return true
    }
}

protocol SendDataToMoviePageVC {
    func sendData()
}
