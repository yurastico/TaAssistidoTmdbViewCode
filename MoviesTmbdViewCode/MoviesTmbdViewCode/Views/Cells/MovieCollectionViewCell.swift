//
//  MovieCollectionViewCell.swift
//  MoviesTmbdViewCode
//
//  Created by Yuri Cunha on 07/01/24.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = .image
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Forest Gump"
        label.font = .systemFont(ofSize: 18,weight: .medium)
        label.textColor = .black
        label.numberOfLines = 2
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupView() {
        addSubviews()
        configConstraints()
    }
    private func addSubviews() {
        addSubview(imageView)
        addSubview(titleLabel)
    }
    
    func setupCell(for movie: Movie) {
        titleLabel.text = movie.title
        print(TmdbMoviesCaller().baseURL + movie.posterPath)
        guard let url = URL(string: "https://api.themoviedb.org/3/" + movie.posterPath) else { return }
        DispatchQueue.global().async { [weak self] in
            
            
            Task {
                guard let image = await TmdbMoviesCaller().getImage(for: movie.posterPath) else { return }
                
                self?.imageView.image = image
            }
              
                   
            
        }
        
       
        
    }
    
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor,constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 4),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4)
            
        ])
    }
    
    
    
}
