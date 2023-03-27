        //
        //  ProfileVC.swift
        //  EShop
        //
        //  Created by Kirill Karpovich on 15.03.23.
        //

        import UIKit

class ProfileVC: UITableViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    private let coordinator: ProfileCoordinator
    
    let profileCategories: [ProfileCategory] = [
        ProfileCategory(image: UIImage(named: "Wallet"), name: "Trade store"),
        ProfileCategory(image: UIImage(named: "Wallet"), name: "Payment method"),
        ProfileCategory(image: UIImage(named: "Wallet"), name: "Balance"),
        ProfileCategory(image: UIImage(named: "Wallet"), name: "Trade history"),
        ProfileCategory(image: UIImage(named: "RestorePurchase"), name: "Restore Purchase"),
        ProfileCategory(image: UIImage(named: "Help"), name: "Help"),
        ProfileCategory(image: UIImage(named: "Logout"), name: "Log out"),
    ]
    
    init(coordinator: ProfileCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        navigationItem.title = "Profile"
        tableView.isScrollEnabled = false
        tableView.register(ProfileTableCell.self, forCellReuseIdentifier: ProfileTableCell.identifier)
        tableView.register(ProfileTVHeader.self, forHeaderFooterViewReuseIdentifier: ProfileTVHeader.identifier)
        tableView.separatorStyle = .none
    }
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: ProfileTVHeader.identifier) as? ProfileTVHeader else { return UIView() }
        header.delegate = self
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        170
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        profileCategories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableCell.identifier) as? ProfileTableCell else {
            return UITableViewCell()
        }
        
        let category = profileCategories[indexPath.row]
        cell.cellLabel.text = category.name
        cell.cellImageView.image = category.image
        
        if indexPath.row == 5 || indexPath.row == 6 {
            cell.disclosureImageView.image = nil
        } else if indexPath.row == 2 {
            cell.disclosureImageView.image = nil
            cell.walletLabel.text = "$ 1593"
        } else {
            cell.accessoryView = cell.disclosureImageView
        }
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        65
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 6 {
            let confirmAlert = UIAlertController(title: "Are you sure you want to log out?", message: nil, preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            let confirmAction = UIAlertAction(title: "Log out", style: .destructive) { _ in
                self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
            }
            confirmAlert.addAction(cancelAction)
            confirmAlert.addAction(confirmAction)
            present(confirmAlert, animated: true, completion: nil)
        }
    }
}

extension ProfileVC: ProfileTVHeaderDelegate {
    func didTapUploadButton() {
        let picker = UIImagePickerController()
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            if let headerView = tableView.headerView(forSection: 0) as? ProfileTVHeader {
                headerView.imageView.image = image
            }
        }
    }
}






