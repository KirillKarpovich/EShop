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
        addSubviews(title, viewButton)
        title.font = EFonts.monsterrat(size: 12)
        viewButton.setTitle("View all", for: .normal)
        viewButton.setTitleColor(.gray, for: .normal)
        viewButton.titleLabel?.font = EFonts.monsterrat(size: 10)
        
        title.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: nil, padding: .init(top: 0, left: 10, bottom: 0, right: 0))
        viewButton.anchor(top: topAnchor, leading: nil, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 10))
   
    }
}
