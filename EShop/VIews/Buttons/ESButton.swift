//
//  ESButton.swift
//  EShop
//
//  Created by Kirill Karpovich on 23.03.23.
//

import UIKit

class ESButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(title: String) {
        self.init(frame: .zero)
        set(title: title)
    }
    
    private func configure() {
        configuration = .filled()
        layer.cornerRadius = 15
        layer.masksToBounds = true
    }
    
    func set(title: String) {
        configuration?.baseBackgroundColor = UIColor(hex: "#4E55D7")
        configuration?.baseForegroundColor = .white
        configuration?.title = title
        configuration?.attributedTitle?.font = EFonts.monsterratBold(size: 17)
    }
}
