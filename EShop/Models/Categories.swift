//
//  Categories.swift
//  EShop
//
//  Created by Kirill Karpovich on 15.03.23.
//

import Foundation
import UIKit

struct Categories {
    let categories = [UIImage(named: "Phones"), UIImage(named: "Headphones"), UIImage(named: "Games"), UIImage(named: "Cars"), UIImage(named: "Furniture"), UIImage(named: "Kids")]
}
struct Category {
    let icon: UIImage?
    let title: String
}
