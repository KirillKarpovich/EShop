//
//  UIView+Ext.swift
//  EShop
//
//  Created by Kirill Karpovich on 15.03.23.
//

import UIKit

extension UIColor {
    
    convenience init(hex: String) {
        let r, g, b: CGFloat
        
        guard hex.hasPrefix("#") else { fatalError("Hex string MUST start from #") }
        
        let start = hex.index(hex.startIndex, offsetBy: 1)
        let hexColor = String(hex[start...])
        
        if hexColor.count == 6 {
            let scanner = Scanner(string: hexColor)
            var hexNumber: UInt64 = 0
            
            if scanner.scanHexInt64(&hexNumber) {
                r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
                g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
                b = CGFloat(hexNumber & 0x0000ff) / 255
                
                self.init(red: r, green: g, blue: b, alpha: 1)
                return
            }
        }
        
        fatalError("Invalid length of hex string \(hex). Expected length is 6")
    }
}
