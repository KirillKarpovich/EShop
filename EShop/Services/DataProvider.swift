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
        var flashSaleResponse: FlashSaleResponse?
        var latestResponse: LatestResponse?
        var error: Error?
        var flashSaleCompleted = false
        var latestCompleted = false

        networkManager.fetchFlashSale { result in
            switch result {
            case .success(let response):
                flashSaleResponse = response
            case .failure(let err):
                error = err
            }
            flashSaleCompleted = true
            if flashSaleCompleted && latestCompleted {
                if let error = error {
                    completion(.failure(error))
                } else if let flashSaleResponse = flashSaleResponse,
                          let latestResponse = latestResponse {
                    completion(.success((flashSaleResponse, latestResponse)))
                }
            }
        }

        networkManager.fetchLatest { result in
            switch result {
            case .success(let response):
                latestResponse = response
            case .failure(let err):
                error = err
            }
            latestCompleted = true
            if flashSaleCompleted && latestCompleted {
                if let error = error {
                    completion(.failure(error))
                } else if let flashSaleResponse = flashSaleResponse,
                          let latestResponse = latestResponse {
                    completion(.success((flashSaleResponse, latestResponse)))
                }
            }
        }
    }
}
