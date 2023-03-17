//
//  HomeCVHeader.swift
//  EShop
//
//  Created by Kirill Karpovich on 17.03.23.
//

import UIKit

class HomeCVHeader: UICollectionReusableView {
    static let identifier = String(describing: HomeCVHeader.self)
        
    let title = UILabel()
    let viewButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .systemPink
        title.font = EFonts.monsterratBold(size: 18)
        
        title.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: nil)
        title.constrainWidth(constant: 30)
        viewButton.anchor(top: topAnchor, leading: nil, bottom: bottomAnchor, trailing: trailingAnchor)
        viewButton.constrainWidth(constant: 30)
    }
}
