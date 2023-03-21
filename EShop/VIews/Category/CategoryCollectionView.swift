//
//  CategoryCollectionView.swift
//  EShop
//
//  Created by Kirill Karpovich on 15.03.23.
//

import UIKit

class CategoryCollectionView: UICollectionView, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    private let layout = UICollectionViewFlowLayout()
    private let sectionInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    
    let categories: [Category] = [
        Category(icon: UIImage(named: "Phones"), title: "Phones"),
        Category(icon: UIImage(named: "Headphones"), title: "Headphones"),
        Category(icon: UIImage(named: "Games"), title: "Games"),
        Category(icon: UIImage(named: "Cars"), title: "Cars"),
        Category(icon: UIImage(named: "Furniture"), title: "Furniture"),
        Category(icon: UIImage(named: "Kids"), title: "Kids"),
    ]
    
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
        self.showsHorizontalScrollIndicator = false
        layout.estimatedItemSize = CGSize(width: 50, height: 100)
        layout.scrollDirection = .horizontal
        self.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 12)
        self.collectionViewLayout = layout
        self.delegate = self
        self.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let categoryCell = self.dequeueReusableCell(withReuseIdentifier: CategoryCell.identifier, for: indexPath) as? CategoryCell
        else { return UICollectionViewCell() }
        
        categoryCell.set(with: categories[indexPath.item])
        return categoryCell
    }
}
