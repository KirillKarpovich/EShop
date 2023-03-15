//
//  CategoryCell.swift
//  EShop
//
//  Created by Kirill Karpovich on 15.03.23.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    static let identifier = String(describing: CategoryCell.self)
    
    private let imageView = UIImageView()
    private let label = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureWith(with category: Category) {
        imageView.image = category.icon
        label.text = category.title
    }
    
    private func configure() {
        addSubviews(imageView, label)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Montserrat", size: 8)
//        label.font = .systemFont(ofSize: 8)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        imageView.contentMode = .scaleAspectFit
//        backgroundColor = .systemPink
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -10),
            imageView.widthAnchor.constraint(equalToConstant: 50),

            label.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            label.heightAnchor.constraint(equalToConstant: 14),
            label.widthAnchor.constraint(equalTo: imageView.widthAnchor)
        ])
    }

}
