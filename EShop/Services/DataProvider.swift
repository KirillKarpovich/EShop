//
//  DataProvider.swift
//  EShop
//
//  Created by Kirill Karpovich on 25.03.23.
//

import UIKit

class DataProvider {
    static let shared = DataProvider()
    
    private let networkManager = NetworkManager.shared
    
    func fetchData(completion: @escaping (Result<(FlashSaleResponse, LatestResponse), Error>) -> Void) {
        let dispatchGroup = DispatchGroup()
        var flashSaleResponse: FlashSaleResponse?
        var latestResponse: LatestResponse?
        var error: Error?
        
        dispatchGroup.enter()
        networkManager.fetchFlashSale { result in
            switch result {
            case .success(let response):
                flashSaleResponse = response
            case .failure(let err):
                error = err
            }
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        networkManager.fetchLatest { result in
            switch result {
            case .success(let response):
                latestResponse = response
            case .failure(let err):
                error = err
            }
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) {
            if let error = error {
                completion(.failure(error))
            } else if let flashSaleResponse = flashSaleResponse,
                      let latestResponse = latestResponse {
                completion(.success((flashSaleResponse, latestResponse)))
            }
        }
    }
}
