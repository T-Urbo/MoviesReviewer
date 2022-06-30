//
//  ViewController.swift
//  MoviesReviewer
//
//  Created by Timothey Urbanovich on 16/04/2022.
//

//MARK: Main Screen ViewController

import UIKit
import Kingfisher

class ViewController: UIViewController, UISearchBarDelegate, UISearchControllerDelegate, UISearchResultsUpdating, UINavigationControllerDelegate {
    
    @IBOutlet weak var topFiveWeekLabel: UILabel!
    @IBOutlet weak var movieCollectionView: UICollectionView!
    
    var movieSearchPosterURL = URL(string: "")
  
    var moviePosterCustomViewCell = MoviePosterCollectionViewCell()
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
    }
    
    func configureViewController() {
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        searchController.delegate = self
        searchController.searchBar.delegate = self
        
        self.movieCollectionView.backgroundColor = .black
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
        searchBar.barStyle = .black
        
        return true
    }
    
    public func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.showsScopeBar = false
        searchBar.sizeToFit()
        searchBar.setShowsCancelButton(false, animated: true)
        searchBar.barStyle = .black
        
        
        return true
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        moviePosterCustomViewCell.moviePostersArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MoviePosterCollectionViewCell
        cell.moviePosterImage.kf.setImage(with: URL(string: moviePosterCustomViewCell.moviePostersArray[indexPath.row]!))
        cell.moviePosterImage.layer.cornerRadius = 10
        
        return cell
    }
    
//    
    
    
}
