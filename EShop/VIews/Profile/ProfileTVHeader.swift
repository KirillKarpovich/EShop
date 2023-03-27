//
//  ProfileTVHeader.swift
//  EShop
//
//  Created by Kirill Karpovich on 24.03.23.
//

import UIKit

protocol ProfileTVHeaderDelegate: AnyObject {
    func didTapUploadButton()
}

class ProfileTVHeader: UITableViewHeaderFooterView, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    static let identifier = String(describing: ProfileTVHeader.self)

    let imageView = UIImageView()
    private let nameLabel = UILabel()
    private let uploadButton = ESButton(title: "Upload item")
    
    weak var delegate: ProfileTVHeaderDelegate?


    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configure()

        uploadButton.addTarget(self, action: #selector(uploadButtonTapped), for: .touchUpInside)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        addSubviews(
            imageView,
            nameLabel,
            uploadButton
        )

        imageView.image = UIImage(named: "Avatar")
        nameLabel.text = "Satria Adhi Pradana"
        nameLabel.font = EFonts.monsterratBold(size: 16)

        imageView.centerXInSuperview()
        imageView.constrainHeight(constant: 60)
        imageView.constrainWidth(constant: 60)
        imageView.layer.cornerRadius = 30 
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill

        nameLabel.centerXInSuperview()
        nameLabel.anchor(top: imageView.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 20, left: 0, bottom: 0, right: 0))

        uploadButton.centerXInSuperview()
        uploadButton.constrainHeight(constant: 40)
        uploadButton.anchor(top: nameLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 20, left: 30, bottom: 10, right: 30))

    }

    @objc private func uploadButtonTapped() {
        delegate?.didTapUploadButton()
        }
}
