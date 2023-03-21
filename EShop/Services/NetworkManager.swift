//
//  NetworkManager.swift
//  EShop
//
//  Created by Kirill Karpovich on 20.03.23.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    
    private let baseURL = "https://run.mocky.io/v3/"
    private let decoder = JSONDecoder()
    private let session = URLSession.shared
    
    func fetchLatest(completion: @escaping (Response?, Error?) -> ()) {
        let urlString = baseURL + "cc0071a1-f06e-48fa-9e90-b1c2a61eaca7"
        fetchGenericJSONData(urlString: urlString, completion: completion)
        print(urlString)
        
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
}
