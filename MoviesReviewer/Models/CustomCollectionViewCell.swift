////
////  CollectionViewCell.swift
////  MoviesReviewer
////
////  Created by Timothey Urbanovich on 25/06/2022.
////
//
//import UIKit
//
//class CustomCollectionViewCell: UICollectionViewCell {
//    
//    static let reuseId = "cell"
//    
//    let mainImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.backgroundColor = .cyan
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        return imageView
//    }()
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        
//        addSubview(mainImageView)
//        mainImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
//        mainImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
//        mainImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
//        mainImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
//
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
