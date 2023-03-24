//
//  ProfileTVHeader.swift
//  EShop
//
//  Created by Kirill Karpovich on 24.03.23.
//

import UIKit

class ProfileTVHeader: UITableViewHeaderFooterView {
    static let identifier = String(describing: ProfileTVHeader.self)
        
    private let imageView = UIImageView()
    private let nameLabel = UILabel()
    private let uploadButton = ESButton(title: "Upload item")
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubviews(
            imageView,
            nameLabel,
            uploadButton
        )
        
        imageView.image = UIImage(named: "Avatar")
        nameLabel.text = "Satria Adhi Pradana"
        nameLabel.font = EFonts.monsterratBold(size: 16)
        
        imageView.centerXInSuperview()
        
        nameLabel.centerXInSuperview()
        nameLabel.anchor(top: imageView.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 20, left: 0, bottom: 0, right: 0))
        
        uploadButton.centerXInSuperview()
        uploadButton.constrainHeight(constant: 40)
        uploadButton.anchor(top: nameLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 20, left: 30, bottom: 10, right: 30))
        
    }
}
