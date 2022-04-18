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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        print(APIRequest)
        
        
    }

    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        
        print(text)
    }
    
    
}
