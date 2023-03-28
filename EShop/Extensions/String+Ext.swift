//
//  String+Ext.swift
//  EShop
//
//  Created by Kirill Karpovich on 16.03.23.
//

import UIKit

extension String {
    private static let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    
    var isValidEmail: Bool {
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", String.emailRegex)
        return emailPredicate.evaluate(with: self)
    }
}
