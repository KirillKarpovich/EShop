//
//  FirstVC.swift
//  EShop
//
//  Created by Kirill Karpovich on 15.03.23.
//

import UIKit

class HomeVC: UIViewController{
    
    private let coordinator: HomeFlow
    
    init(coordinator: HomeFlow) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Trade by Kirill"
        navControllerConfig()
        configureSearchController()
        configureCategoryCollectionView()
    }
    
    func configureCategoryCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 10
//        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        

        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        collectionView.register(LatestCollectionViewCell.self, forCellWithReuseIdentifier: LatestCollectionViewCell.identifier)
        collectionView.register(FlashSaleCollectionViewCell.self, forCellWithReuseIdentifier: FlashSaleCollectionViewCell.identifier)
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderView")

        collectionView.backgroundColor = .gray
        collectionView.alwaysBounceVertical = true
        
        view.addSubview(collectionView)
        collectionView.fillSuperview()
    }
    

    
    func navControllerConfig() {
        navigationItem.rightBarButtonItem = .init(barButtonSystemItem: .refresh, target: self, action: nil)
        navigationItem.leftBarButtonItem = .init(image: UIImage(named: "ProfileMenu"), style: .plain, target: self, action: nil)
        navigationController?.navigationBar.backgroundColor = .systemGray3
    }
    
    func configureSearchController() {
        let searchController = UISearchController()
        //        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "What are you looking for?"
        //        searchController.searchBar.searchBarStyle = .minimal
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    
}
extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath)
            return cell
        } else if indexPath.item == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LatestCollectionViewCell.identifier, for: indexPath)
            return cell
        } else  {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FlashSaleCollectionViewCell.identifier, for: indexPath)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item == 0 {
            return CGSize(width: view.frame.size.width, height: 120)
        } else if indexPath.item == 1 {
            return CGSize(width: view.frame.size.width, height: 190)
        } else {
            return CGSize(width: view.frame.size.width, height: 240)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
            // Return zero size for the first cell
            if section == 0 {
                return CGSize.zero
            } else {
                // Return the size you want for the header view
                return CGSize(width: view.frame.size.width, height: 50)
            }
        }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if indexPath.section == 0 {
            // Return nil for the first cell
            return UICollectionReusableView()
        } else {
            // Dequeue a header view for the second and third cells
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderView", for: indexPath)
            headerView.backgroundColor = .white
            // Configure your header view here
            let titleLabel = UILabel()
            titleLabel.text = "Header Title"
            titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            headerView.addSubview(titleLabel)
            NSLayoutConstraint.activate([
                titleLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 10),
                titleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 10),
                titleLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -10),
                titleLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -10),
            ])
            return headerView
        }
    }
}

