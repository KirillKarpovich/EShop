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
        
    ////        title.anchor(top: nil, leading: self.leadingAnchor, bottom: nil, trailing: nil)
    //        title.constrainWidth(constant: 30)
    //        title.constrainHeight(constant: 20)
    ////        viewButton.anchor(top: topAnchor, leading: nil, bottom: self.bottomAnchor, trailing: self.trailingAnchor)
    //        viewButton.constrainWidth(constant: 30)
    //        viewButton.constrainHeight(constant: 20)
        
    }
}
