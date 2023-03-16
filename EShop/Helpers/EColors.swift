//
//  EColors.swift
//  EShop
//
//  Created by Kirill Karpovich on 16.03.23.
//

import UIKit

enum Fonts {
    
    static func monsterrat(size: CGFloat) -> UIFont {
        UIFont(name: "Monsterrat", size: size ) ?? UIFont.systemFont(ofSize: size)
    }
}
