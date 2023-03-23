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
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 30
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        collectionView.register(LatestCollectionViewCell.self, forCellWithReuseIdentifier: LatestCollectionViewCell.identifier)
        collectionView.register(FlashSaleCollectionViewCell.self, forCellWithReuseIdentifier: FlashSaleCollectionViewCell.identifier)
        collectionView.register(HomeCVHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomeCVHeader.identifier)
        
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
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HomeCVHeader.identifier, for: indexPath) as? HomeCVHeader
        else { return UICollectionReusableView() }
        if indexPath.section == 1{
            sectionHeader.title.text = "Latest"
        } else {
            sectionHeader.title.text = "Flash Sale"
        }
        return sectionHeader
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize.zero
        } else{
            return CGSize(width: collectionView.frame.width, height: 30)
        }
    }
    
}
extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
           3
       }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = indexPath.section
        switch section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath)
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LatestCollectionViewCell.identifier, for: indexPath)
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FlashSaleCollectionViewCell.identifier, for: indexPath)
            return cell
        default:
            fatalError("Invalid section")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: view.frame.size.width, height: 120)
        } else if indexPath.section == 1 {
            return CGSize(width: view.frame.size.width, height: 150)
        } else {
            return CGSize(width: view.frame.size.width, height: 220)
        }
    }
}

