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
    
    func setFlashSale(with product: Products) {
        nameLabel.text = product.name
        categoryLabel.text = product.category
        discountLabel.text = String("\(product.discount!)% off")
        priceLabel.text = String("$ \(product.price)")
    }
    
    func setLatest(with product: Products) {
        nameLabel.text = product.name
        categoryLabel.text = product.category
        priceLabel.text = String("$ \(product.price)")
        discountLabel.isHidden = true
        avatarImageView.isHidden = true
        likeButton.isHidden = true
    }
    
    private func configure() {
        backgroundColor = .systemMint
        layer.cornerRadius = 15
        layer.masksToBounds = true
        contentView.addSubviews(discountLabel, avatarImageView, categoryLabel, priceLabel, nameLabel, addButton, likeButton)
        
        discountLabel.font = EFonts.monsterratBold(size: 11)
        discountLabel.textAlignment = .center
        discountLabel.textColor = .white
        discountLabel.layer.cornerRadius = 10
        discountLabel.layer.masksToBounds = true
        discountLabel.backgroundColor = .red

        priceLabel.font = EFonts.monsterratSemiBold(size: 10)
        priceLabel.textColor = .white
        
        nameLabel.font = EFonts.monsterratSemiBold(size: 0)
        nameLabel.numberOfLines = 2
        nameLabel.textColor = .white
        let maxFontSize = min(contentView.frame.width / 14, 12)

        nameLabel.font = EFonts.monsterratBold(size: maxFontSize)
//        nameLabel.sizeToFit()

        categoryLabel.font = EFonts.monsterratSemiBold(size: 10)
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
        nameLabel.anchor(top: categoryLabel.bottomAnchor, leading: contentView.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 3, left: 10, bottom: 0, right: 0))
        nameLabel.constrainWidth(constant: contentView.frame.size.width/2)
//        nameLabel.constrainHeight(constant: contentView.frame.size.height/5)
        categoryLabel.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: contentView.frame.size.height/2, left: 10, bottom: 0, right: 0))
        categoryLabel.constrainWidth(constant: 50)
        categoryLabel.constrainHeight(constant: 20)
        addButton.anchor(top: nil, leading: nil, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 6, right: 6))
        likeButton.anchor(top: nil, leading: nil, bottom: nil, trailing: addButton.leadingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 5))
        likeButton.centerYAnchor.constraint(equalTo: addButton.centerYAnchor).isActive = true
        addButton.constrainWidth(constant: contentView.frame.width/4)
        addButton.constrainHeight(constant: contentView.frame.width/4)
        likeButton.constrainWidth(constant: contentView.frame.width/5)
        likeButton.constrainHeight(constant: contentView.frame.width/5)


    }
    
}
