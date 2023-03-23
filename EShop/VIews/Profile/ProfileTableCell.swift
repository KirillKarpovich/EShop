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

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        contentView.addSubviews(cellImageView, cellLabel)
        cellLabel.font = EFonts.monsterrat(size: 18)
        cellImageView.contentMode = .scaleAspectFit
        
        cellImageView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: nil)
        cellLabel.anchor(top: topAnchor, leading: cellImageView.trailingAnchor, bottom: bottomAnchor, trailing: nil, padding: .init(top: 0, left: 10, bottom: 0, right: 0))
    }
}
