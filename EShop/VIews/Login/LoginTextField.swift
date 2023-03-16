//
//  LoginTextField.swift
//  EShop
//
//  Created by Kirill Karpovich on 16.03.23.
//

import UIKit

class LoginTextField: UITextField {
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        centerPlaceholder()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(placeholder: String) {
        self.init(frame: .zero)
        self.placeholder = placeholder
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 15
        backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.9098039269, blue: 0.9098039269, alpha: 1)
        autocorrectionType = .no
        textAlignment = .center
        clearButtonMode = .whileEditing
        constrainHeight(constant: 30)
    }
    
    private func centerPlaceholder() {
        let centeredParagraphStyle = NSMutableParagraphStyle()
        centeredParagraphStyle.alignment = .center
        
        let font = UIFont(name: "Montserrat", size: 14) ?? UIFont.systemFont(ofSize: 17)
        let attributes: [NSAttributedString.Key: Any] = [.font: font, .paragraphStyle: centeredParagraphStyle, NSAttributedString.Key.foregroundColor: UIColor.secondaryLabel]
        
        attributedPlaceholder = NSAttributedString(string: "Placeholder", attributes: attributes)
    }
}
