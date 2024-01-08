//
//  FeatureMoviesView.swift
//  MoviesTmbdViewCode
//
//  Created by Yuri Cunha on 07/01/24.
//

import UIKit

class FeatureMoviesView: UIView {
    
    private lazy var moviesCollection: UICollectionView = {
        let collection = UICollectionView()
        collection.translatesAutoresizingMaskIntoConstraints = false
        
        
        let flowLayout = UICollectionViewFlowLayout()
        collection.collectionViewLayout = flowLayout
        return collection
    }()
    
    
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .green
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubviews()
        setupConstraints()
    }
    
    private func addSubviews() {
        addSubview(moviesCollection)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            moviesCollection.topAnchor.constraint(equalTo: topAnchor),
            moviesCollection.leadingAnchor.constraint(equalTo: leadingAnchor),
            moviesCollection.trailingAnchor.constraint(equalTo: trailingAnchor),
            moviesCollection.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
}


extension FeatureMoviesView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = UICollectionViewCell()
        cell.backgroundColor = .blue
        return cell
    }
    
    
    
}
