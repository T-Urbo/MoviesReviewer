//
//  MoviePageViewController.swift
//  MoviesReviewer
//
//  Created by Timothey Urbanovich on 22/04/2022.
//

import UIKit
import Foundation

class MoviePageViewController: UIViewController, SendDataToMoviePageVC {
    func sendData() {
        print("")
    }
    
    func sendData(image: UIImage?, text: String?) {
        movieNameLabel.text = text
    }
    
//    var sendDelegate: SendDataToMoviePageVC?
    
//
//    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var moviePoster: UIImageView!
    
    var movieName: String = ""
    var imageURL: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieNameLabel.text = movieName
        moviePoster.kf.setImage(with: URL(string: imageURL))
        
    }
    
    
}

