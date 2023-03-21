//
//  Response.swift
//  EShop
//
//  Created by Kirill Karpovich on 16.03.23.
//

import Foundation

struct Response: Decodable {
    let latest: [Products]?
    let flashSale: [Products]?
}

struct Products: Decodable {
    let category: String
    let name: String
    let price: Int
    let discount: Int?
    let imageUrl: String?
}


struct ProductDTO: Decodable {
    let category: String
    let name: String
    let price: Int
    let discount: Int?
    let imageUrl: URL?
}

//struct ProductModel {
//    let category: String
//    let name: String
//    let price: String // $1000
//    let discount: Int? // 30% off
//    let imageUrl: URL?
//    let type: ProductType
//    
//    
//    
//}

//enum ProductType {
//    case flasSale, latest
//}
//NS.fetch() -> [ProductModel] {
//    let array: [ProductDTO] = []
////    NumberFormatter().string(from: <#T##NSNumber#>)
//    let result: [ProductModel] = array.map { dto in
//        let priceString = nf.strin
//
//        ProductModel(
//            category: dto.ca,
//            name: <#T##String#>,
//            price: priceString,
//            discount: <#T##Int?#>,
//            imageUrl: <#T##URL?#>,
//            type: .flasSale
//        )
//    }
//
//}
//
//struct FlashSaleDTO: Decodable {
//    let flashSale: [ProductDTO]
//}
//struct LatestDTO: Decodable {
//    let latest: [ProductDTO]
//}

//class NetworkManager {
//    
//    func fetchProduct(type: ProductType) -> [ProductModel] {
//        let dtos: [ProductDTO]
//        if type == .flasSale {
//            // use flash sale url
//        } else {
//            // use latestProduct
//        }
//        // formatter
//        return dtos.map { dto in
//            // formatters
//            ProductModel(category: <#T##String#>, name: <#T##String#>, price: <#T##String#>, discount: <#T##Int?#>, imageUrl: <#T##URL?#>, type: type)
//        }
//        
//    }
//}

/*
 {
   "category": "Phones",
   "name": "Samsung S10",
   "price": 1000,
   "image_url": "https://www.dhresource.com/0x0/f2/albu/g8/M01/9D/19/rBVaV1079WeAEW-AAARn9m_Dmh0487.jpg"
 },
 
 {
   "category": "Kids",
   "name": "New Balance Sneakers",
   "price": 22.5,
   "discount": 30,
   "image_url": "https://newbalance.ru/upload/iblock/697/iz997hht_nb_02_i.jpg"
 },
 */
