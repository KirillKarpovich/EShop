//
//  Fonts.swift
//  EShop
//
//  Created by Kirill Karpovich on 16.03.23.
//

import UIKit

enum EFonts {
    
    static func monsterrat(size: CGFloat) -> UIFont {
        UIFont(name: "Monsterrat", size: size ) ?? UIFont.systemFont(ofSize: size)
    }
    
    static func monsterratSemiBold(size: CGFloat) -> UIFont {
        UIFont(name: "Montserrat-SemiBold", size: size ) ?? UIFont.systemFont(ofSize: size)
    }
    
    static func monsterratBold(size: CGFloat) -> UIFont {
        UIFont(name: "Montserrat-Bold", size: size ) ?? UIFont.systemFont(ofSize: size)
    }
}
