//
//  CategoryCollectionView.swift
//  EShop
//
//  Created by Kirill Karpovich on 15.03.23.
//

import UIKit

class CategoryCollectionView: UICollectionView, UICollectionViewDelegateFlowLayout {

    private let layout = UICollectionViewFlowLayout()
    private let itemsForRow: CGFloat = 6
    private let sectionInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: self.layout)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.alwaysBounceHorizontal = true
        self.register(
            CategoryCell.self,
            forCellWithReuseIdentifier: CategoryCell.identifier
        )
        self.backgroundColor = .gray
        self.showsHorizontalScrollIndicator = false
        layout.estimatedItemSize = CGSize(width: 50, height: 100)
        layout.scrollDirection = .horizontal
        
        self.contentInset = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)

//
//        let paddingWidth = sectionInsets.left * (itemsForRow + 1)
//        let availableWidth = UIScreen.main.bounds.width - paddingWidth
//        let widthPerItem = availableWidth / itemsForRow
//
//        layout.itemSize = CGSize(width: widthPerItem, height: widthPerItem)
    }
}
