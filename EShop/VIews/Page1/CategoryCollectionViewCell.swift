//
//  CategoryCollectionViewCell.swift
//  EShop
//
//  Created by Kirill Karpovich on 18.03.23.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: CategoryCollectionViewCell.self)
    
    private let categoryCollectionView = CategoryCollectionView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(categoryCollectionView)
        categoryCollectionView.fillSuperview()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
