//
//  LatestCollectionVC.swift
//  EShop
//
//  Created by Kirill Karpovich on 16.03.23.
//

import UIKit

class FlashSaleCollectionVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let layout = UICollectionViewFlowLayout()

    override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: self.layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        self.collectionView!.register(ProductCell.self, forCellWithReuseIdentifier: ProductCell.identifier)

        view.backgroundColor = .green
        layout.collectionView?.backgroundColor = .green
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        collectionView.showsHorizontalScrollIndicator = false
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 175, height: 220)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.identifier, for: indexPath)
        
        return cell
    }
}
