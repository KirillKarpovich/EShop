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
    
    func fetchLatest(completion: @escaping (Response?, Error?) -> ()) {
        let urlString = baseURL + "cc0071a1-f06e-48fa-9e90-b1c2a61eaca7"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchFlashSale(completion: @escaping (Response?, Error?) -> ()) {
        let urlString = baseURL + "a9ceeb6e-416d-4352-bde6-2203416576ac"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchGenericJSONData<T: Decodable>(urlString: String, completion: @escaping (T?, Error?) -> ()) {
        
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                completion(nil, err)
                print(err)
                return
            }
            do {
                self.decoder.keyDecodingStrategy = .convertFromSnakeCase
                let objects = try self.decoder.decode(T.self, from: data!)
                completion(objects, nil)
            } catch {
                completion(nil, error)
                print(error)
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
