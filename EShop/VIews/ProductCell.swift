//
//  ProductCell.swift
//  EShop
//
//  Created by Kirill Karpovich on 16.03.23.
//

import UIKit

class ProductCell: UICollectionViewCell {
    static let identifier = String(describing: ProductCell.self)
    
    let cellImageView = UIImageView()
    let avatarImageView = UIImageView()
    let discountLabel = UILabel()
    let categoryLabel = UILabel()
    let nameLabel = UILabel()
    let likeButton = UIButton()
    let addButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        cellImageView.image = nil
        avatarImageView.image = nil
    }
    
    private func configure() {
        backgroundColor = .systemMint
        layer.cornerRadius = 15
        layer.masksToBounds = true
    }
    
}
