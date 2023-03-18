//
//  LatestCollectionViewCell.swift
//  EShop
//
//  Created by Kirill Karpovich on 18.03.23.
//

import UIKit

class LatestCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: LatestCollectionViewCell.self)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemMint
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

