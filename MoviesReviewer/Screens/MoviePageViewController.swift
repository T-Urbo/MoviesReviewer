//
//  MoviePageViewController.swift
//  MoviesReviewer
//
//  Created by Timothey Urbanovich on 22/04/2022.
//

// TODO: Make Sorting Option for the search bar
// TODO: Add like and dislike buttons


import UIKit
import Foundation

class MoviePageViewController: UIViewController, SendDataToMoviePageVC {
    func sendData() {
        print("")
    }

    @IBOutlet weak var moviePageBackground: UIImageView!
    
    var movieName: String = ""
    var imageURL: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureMoviePage()
        
    }
    
    func configureMoviePage() {
        self.title = movieName
        moviePageBackground.kf.setImage(with: URL(string: imageURL))
        self.view.sendSubviewToBack(moviePageBackground)
        moviePageBackground.addOverlay()
    }
}

extension UIView {
    func addOverlay(color: UIColor = .black, alpha : CGFloat = 0.6) {
        let overlay = UIView()
        overlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        overlay.frame = bounds
        overlay.backgroundColor = color
        overlay.alpha = alpha
        addSubview(overlay)
    }
}

