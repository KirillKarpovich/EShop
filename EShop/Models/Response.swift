//
//  Response.swift
//  EShop
//
//  Created by Kirill Karpovich on 16.03.23.
//

import UIKit

struct LatestResponse: Decodable {
    let latest: [Latest]
}

struct FlashSaleResponse: Decodable {
    let flashSale: [FlashSale]
}

struct FlashSale: Decodable {
    let category: String
    let name: String
    let price: Double
    let discount: Int?
    let imageUrl: String?
}

struct Latest: Decodable {
    let category: String
    let name: String
    let price: Double
    let imageUrl: String?
}
