        //
        //  NetworkManager.swift
        //  EShop
        //
        //  Created by Kirill Karpovich on 20.03.23.
        //

import UIKit

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let baseURL = "https://run.mocky.io/v3/"
    private let decoder = JSONDecoder()
    private let session = URLSession.shared
    
    func fetchLatest(completion: @escaping (Result<LatestResponse, Error>) -> ()) {
        let urlString = baseURL + "cc0071a1-f06e-48fa-9e90-b1c2a61eaca7"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchFlashSale(completion: @escaping (Result<FlashSaleResponse, Error>) -> ()) {
        let urlString = baseURL + "a9ceeb6e-416d-4352-bde6-2203416576ac"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    private func fetchGenericJSONData<T: Decodable>(urlString: String, completion: @escaping (Result<T, Error>) -> ()) {
        
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(.failure(NSError(domain: "Invalid response", code: 0, userInfo: nil)))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "Invalid data", code: 0, userInfo: nil)))
                return
            }
            
            do {
                self.decoder.keyDecodingStrategy = .convertFromSnakeCase
                let objects = try self.decoder.decode(T.self, from: data)
                completion(.success(objects))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    func downloadImage(from urlString: String, completed: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        let task = session.dataTask(with: url) { data, response, error in
            guard error == nil,
                  let response = response as? HTTPURLResponse, response.statusCode == 200,
                  let data = data,
                  let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            completed(image)
        }
        task.resume()
    }
}

