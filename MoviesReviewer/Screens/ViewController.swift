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
    
    @IBOutlet weak var movieCollectionView: UICollectionView!
    
    var moviePostersArray = [0:"https://m.media-amazon.com/images/M/MV5BZjQxYTA3ODItNzgxMy00N2Y2LWJlZGMtMTRlM2JkZjI1ZDhhXkEyXkFqcGdeQXVyNDk3NzU2MTQ@._V1_SX300.jpg",
        1:"https://m.media-amazon.com/images/M/MV5BNjgwNzAzNjk1Nl5BMl5BanBnXkFtZTgwMzQ2NjI1OTE@._V1_SX300.jpg",
        2:"https://m.media-amazon.com/images/M/MV5BMDdmMTBiNTYtMDIzNi00NGVlLWIzMDYtZTk3MTQ3NGQxZGEwXkEyXkFqcGdeQXVyMzMwOTU5MDk@._V1_SX300.jpg",
        3:"https://m.media-amazon.com/images/M/MV5BZmQ1NDZjMTktMjFhZC00ZGY5LWEyMTMtNDhkOWM4NmMyZjI0XkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_SX300.jpg",
        4:"https://m.media-amazon.com/images/M/MV5BMGI1NjA1MjUtNGQxNC00NDYyLThjODgtZjFkZjQ4OGM0NDc5XkEyXkFqcGdeQXVyMTM0NTUzNDIy._V1_SX300.jpg"]
    
//    private var customCollectionView = CustomCollectionView()
    
    @IBOutlet weak var topFiveWeekLabel: UILabel!
    
    public var movieNameToSegue: String = ""
    public var completionHandler: ((String?) -> Void)?
    
    var movieSearchPosterURL = URL(string: "")
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSearchBar()
        self.movieCollectionView.backgroundColor = .black
        
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

//extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return moviePosterImagesURL.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
//
//        return cell
//    }
//
//
//}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        moviePostersArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MoviePosterCollectionViewCell
        cell.moviePosterImage.kf.setImage(with: URL(string: moviePostersArray[indexPath.row]!))
        cell.moviePosterImage.layer.cornerRadius = 20
        
        return cell
    }
    
    
}


protocol SendDataToMoviePageVC {
    func sendData()
}
