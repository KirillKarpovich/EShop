//
//  LatestCollectionVC.swift
//  EShop
//
//  Created by Kirill Karpovich on 17.03.23.
//

import UIKit

class LatestCollectionVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    private let layout = UICollectionViewFlowLayout()
    
    private var products = [Latest]()
    
    private var latestData: LatestResponse?


    override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: self.layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        loadData()
    }
    
    
    private func loadData() {
        DataProvider.shared.fetchData { [weak self] result in
            switch result {
            case .success(let (_, latestResponse)):
                self?.latestData = latestResponse
                self?.products = latestResponse.latest
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
            case .failure(let error):
                print("Failed to load data: \(error)")
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
