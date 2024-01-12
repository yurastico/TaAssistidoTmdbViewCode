//
//  MoviesCollectionReusableView.swift
//  MoviesTmbdViewCode
//
//  Created by Yuri Cunha on 08/01/24.
//

import UIKit

class MoviesCollectionReusableView: UICollectionReusableView {
    private lazy var segmentedControl: UISegmentedControl = {
        let control = UISegmentedControl()
        control.translatesAutoresizingMaskIntoConstraints = false
        control.insertSegment(withTitle: "Upcoming", at: 0, animated: true)
        control.insertSegment(withTitle: "Popular", at: 1, animated: true)
        return control
    }()
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Upcoming Movies"
        label.font = .systemFont(ofSize: 36,weight: .bold)
        label.textColor = .black
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Class Methods
    private func setupView() {
        addSubviews()
        configConstraints()
    }
    private func addSubviews() {
        addSubview(segmentedControl)
        addSubview(headerLabel)
    }
    
    private func configConstraints() {
        
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: topAnchor),
            segmentedControl.centerXAnchor.constraint(equalTo: centerXAnchor),
            headerLabel.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor,constant: 8),
            
            headerLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
