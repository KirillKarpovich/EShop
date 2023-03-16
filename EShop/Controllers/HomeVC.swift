//
//  FirstVC.swift
//  EShop
//
//  Created by Kirill Karpovich on 15.03.23.
//

import UIKit

class HomeVC: UIViewController {
    
    private let coordinator: HomeFlow
    
    init(coordinator: HomeFlow) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let categoryCollectionView = CategoryCollectionView(frame: .zero)
    private let latestProductCollectionVC = LatestCollectionVC(collectionViewLayout: UICollectionViewFlowLayout())
    
    let categories: [Category] = [
        Category(icon: UIImage(named: "Phones"), title: "Phones"),
        Category(icon: UIImage(named: "Headphones"), title: "Headphones"),
        Category(icon: UIImage(named: "Games"), title: "Games"),
        Category(icon: UIImage(named: "Cars"), title: "Cars"),
        Category(icon: UIImage(named: "Furniture"), title: "Furniture"),
        Category(icon: UIImage(named: "Kids"), title: "Kids"),

    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Trade by Kirill"
        view.backgroundColor = .white
        navControllerConfig()
        configureSearchController()
        configureCategoryCollectionView()

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
    
    private func configureCategoryCollectionView() {
        view.addSubviews(categoryCollectionView, latestProductCollectionVC.view)
        
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
                
        latestProductCollectionVC.view.anchor(top: nil, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 30, right: 0))
        latestProductCollectionVC.view.constrainHeight(constant: 240)
        
        NSLayoutConstraint.activate([
            categoryCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            categoryCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            categoryCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            categoryCollectionView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}
extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categories.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let categoryCell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.identifier, for: indexPath) as? CategoryCell
        else { return UICollectionViewCell() }
        
        categoryCell.set(with: categories[indexPath.item])
        
        return categoryCell
    }
}
