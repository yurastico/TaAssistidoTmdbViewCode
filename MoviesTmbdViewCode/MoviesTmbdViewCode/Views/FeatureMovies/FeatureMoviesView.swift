//
//  FeatureMoviesView.swift
//  MoviesTmbdViewCode
//
//  Created by Yuri Cunha on 07/01/24.
//

import UIKit

class FeatureMoviesView: UIView {
    
    private var movies: [Movie] = []
    lazy var moviesCollection: UICollectionView = {
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: 20, left: 26, bottom: 10, right: 26)
        let collection = UICollectionView(frame: .zero,collectionViewLayout: flowLayout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: "MovieCollectionViewCell")
        collection.register(MoviesCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "MoviesCollectionReusableView")
        collection.dataSource = self
        collection.delegate = self
        
        return collection
    }()
    
    
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .green
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadMovies(_ movies: [Movie]) {
        self.movies = movies
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
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as? MovieCollectionViewCell else { fatalError() }
        
        cell.setupCell(for: movies[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "MoviesCollectionReusableView", for: indexPath) as? MoviesCollectionReusableView else { fatalError() }
            return header
        }
        return UICollectionReusableView()
       }

    
    
    
}

extension FeatureMoviesView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 3, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 150)
    }
    
}
