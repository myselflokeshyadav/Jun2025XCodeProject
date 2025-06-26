//
//  NetworkManager.swift
//  June23
//  Created by Lokesh Yadav on 24/06/25.

import Foundation
import UIKit

protocol Networking {
    func fetchData<T: Decodable> (from urlstr: String, completion: @escaping (Result<T, NetworkError>) -> ())
    
    func fetchImageData(from urlStr: String, completion: @escaping(Result<UIImage, NetworkError>) -> ())
}

class NetworkManager: Networking {
    
    static var shared = NetworkManager()
    private init() {}
    
    func fetchData<T>(from urlstr: String, completion: @escaping (Result<T, NetworkError>) -> ()) where T : Decodable {
        
        guard let url = URL(string: urlstr) else {
            completion(.failure(.invalidURL))
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, err in
            
            if let error = err{
                completion(.failure(.requestFailed(error)))
                return
            }
            guard let data = data else {
                completion(.failure(.badResponse))
                return
            }
            do {
                
                let decodeData = try JSONDecoder().decode(T.self, from: data)
                completion(.success( decodeData))
            }catch{
                completion(.failure(.decodablFailed(error)))
            }
            
        }.resume()
    }
    
    func fetchImageData(from urlStr: String, completion: @escaping (Result<UIImage, NetworkError>) -> ()) {
        
        if let image = ImageCache.shared.cache.object(forKey: urlStr as NSString){
            completion(.success(image))
            return
        }
        guard let url = URL(string: urlStr) else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, err in
            if let error = err{
                completion(.failure(.requestFailed(error)))
                return
            }
            guard let data = data else {
                completion(.failure(.badResponse))
                return
            }
            if let image = UIImage(data: data){
                ImageCache.shared.cache.setObject(image, forKey: urlStr as NSString)
                completion(.success(image))
            }
            
        }.resume()
        
    }
}

class ImageCache {
    static let shared = ImageCache()
    private init() {}
    let cache = NSCache<NSString, UIImage>()
}
