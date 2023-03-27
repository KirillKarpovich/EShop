//
//  ProfileTableCell.swift
//  EShop
//
//  Created by Kirill Karpovich on 17.03.23.
//

import UIKit

class ProfileTableCell: UITableViewCell {
    static let identifier = String(describing: ProfileTableCell.self)
    
    let cellImageView = UIImageView()
    let cellLabel = UILabel()
    var disclosureImageView = UIImageView()
    let walletLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        contentView.addSubviews(cellImageView, cellLabel, disclosureImageView, walletLabel)
        cellLabel.font = EFonts.monsterrat(size: 18)
        cellImageView.contentMode = .scaleAspectFit
        
        disclosureImageView.anchor(top: topAnchor, leading: nil, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: contentView.frame.size.height/1.6, left: 0, bottom: contentView.frame.size.height/1.6, right: 20))
        walletLabel.anchor(top: topAnchor, leading: nil, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: contentView.frame.size.height/2, left: 0, bottom: contentView.frame.size.height/2, right: 20))
        
        disclosureImageView.image = UIImage(named: "disclosureIndicator")

        cellImageView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: nil, padding: .init(top: 0, left: 20, bottom: 0, right: 0))
        cellLabel.anchor(top: topAnchor, leading: cellImageView.trailingAnchor, bottom: bottomAnchor, trailing: nil, padding: .init(top: 0, left: 10, bottom: 0, right: 0))
        
        
    }
}
