//
//  AuthButton.swift
//  EShop
//
//  Created by Kirill Karpovich on 16.03.23.
//

import UIKit

class AuthButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(title: String, imageName: String) {
        self.init(frame: .zero)
        set(title: title, imageName: imageName)
    }
        
    private func configure() {
        configuration = .plain()
        configuration?.cornerStyle = .medium
        translatesAutoresizingMaskIntoConstraints = false

    }
    
    func set(title: String, imageName: String) {
        configuration?.baseForegroundColor = .black
        configuration?.title = title
        configuration?.attributedTitle?.font = UIFont(name: "Montserrat", size: 12)
        configuration?.image = UIImage(named: imageName)
        configuration?.imagePadding = 14
        configuration?.imagePlacement = .leading
    }
}

