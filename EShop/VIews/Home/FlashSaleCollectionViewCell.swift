//
//  FlashSaleCollectionViewCell.swift
//  EShop
//
//  Created by Kirill Karpovich on 18.03.23.
//

import UIKit

class FlashSaleCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: FlashSaleCollectionViewCell.self)
    
    private let flashCollectionVC = FlashSaleCollectionVC(collectionViewLayout: UICollectionViewFlowLayout())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemMint
        contentView.addSubview(flashCollectionVC.view)
        flashCollectionVC.view.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
