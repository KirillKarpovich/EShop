//
//  HomeHeaderView.swift
//  EShop
//
//  Created by Kirill Karpovich on 22.03.23.
//

import UIKit

class HomeHeaderView: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .black
        label.textAlignment = .left
        label.text = "Title"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let viewAllButton: UIButton = {
        let button = UIButton()
        button.setTitle("View All", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubview(titleLabel)
        addSubview(viewAllButton)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            viewAllButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            viewAllButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            viewAllButton.widthAnchor.constraint(equalToConstant: 80),
            viewAllButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
