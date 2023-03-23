//
//  LatestCollectionVC.swift
//  EShop
//
//  Created by Kirill Karpovich on 17.03.23.
//

import UIKit


class LatestCollectionVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    private let layout = UICollectionViewFlowLayout()
    
    private var products = [Products]()

    override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: self.layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        fetchLatest()
    }
    
    private func fetchLatest() {
        NetworkManager.shared.fetchLatest { [weak self] (response: Response?, error) in
            if let error = error {
                print(error)
                return
            }
            if let products = response?.latest {
                self?.products = products
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
            }
        }
    }
    
    private func configure() {
        self.collectionView.register(
            ProductCell.self,
            forCellWithReuseIdentifier: ProductCell.identifier
        )
        collectionView.delegate = self

        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 115, height: 150)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.identifier, for: indexPath) as? ProductCell else {
            return UICollectionViewCell()
        }
        cell.setLatest(with: products[indexPath.item])
        return cell
    }
}
