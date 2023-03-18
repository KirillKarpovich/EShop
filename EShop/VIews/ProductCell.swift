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
    let avatarImageView = UIImageView(image: UIImage(named: "AvatarTrader"))
    let discountLabel = UILabel()
    let categoryLabel = UILabel()
    let nameLabel = UILabel()
    let priceLabel = UILabel()
    let likeButton = UIButton()
    let addButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func prepareForReuse() {
//        cellImageView.image = nil
//        avatarImageView.image = nil
//    }
    
    private func configure() {
        backgroundColor = .systemMint
        layer.cornerRadius = 15
        layer.masksToBounds = true
        contentView.addSubviews(discountLabel, avatarImageView, categoryLabel, priceLabel, nameLabel, addButton, likeButton)
        
        discountLabel.text = "30% off"
        discountLabel.font = EFonts.monsterratBold(size: 11)
        discountLabel.textAlignment = .center
        discountLabel.textColor = .white
        discountLabel.layer.cornerRadius = 10
        discountLabel.layer.masksToBounds = true
        discountLabel.backgroundColor = .red

        priceLabel.text = "33,0"
        priceLabel.font = UIFont(name: "Montserrat", size: 10)
        
        nameLabel.text = "New balance sneakers"
        nameLabel.font = EFonts.monsterratSemiBold(size: 14)
        nameLabel.numberOfLines = 0

        categoryLabel.text = "Kids"
        categoryLabel.font = UIFont(name: "Montserrat", size: 10)
        categoryLabel.textColor = .black
        categoryLabel.textAlignment = .center
        categoryLabel.layer.cornerRadius = 10
        categoryLabel.layer.masksToBounds = true
        categoryLabel.backgroundColor = .systemGray3.withAlphaComponent(0.5)
        
        addButton.setBackgroundImage(UIImage(named: "AddButton"), for: .normal)
        likeButton.setBackgroundImage(UIImage(named: "LikeButton"), for: .normal)
        
        
        discountLabel.anchor(top: contentView.topAnchor, leading: nil, bottom: nil, trailing: contentView.trailingAnchor, padding: .init(top: 7, left: 0, bottom: 0, right: 8))
        discountLabel.constrainWidth(constant: 50)
        discountLabel.constrainHeight(constant: 20)
        avatarImageView.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 7, left: 10, bottom: 0, right: 0))
        priceLabel.anchor(top: nil, leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: nil, padding: .init(top: 0, left: 10, bottom: 16, right: 0))
        nameLabel.anchor(top: nil, leading: contentView.leadingAnchor, bottom: priceLabel.topAnchor, trailing: nil, padding: .init(top: 0, left: 10, bottom: 16, right: 0))
        nameLabel.constrainWidth(constant: 100)
        categoryLabel.anchor(top: nil, leading: contentView.leadingAnchor, bottom: nameLabel.topAnchor, trailing: nil, padding: .init(top: 0, left: 10, bottom: 12, right: 0))
        categoryLabel.constrainWidth(constant: 50)
        categoryLabel.constrainHeight(constant: 20)
        addButton.anchor(top: nil, leading: nil, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 6, right: 6))
        likeButton.anchor(top: nil, leading: nil, bottom: contentView.bottomAnchor, trailing: addButton.leadingAnchor, padding: .init(top: 0, left: 0, bottom: 10, right: 5))
    }
    
}
