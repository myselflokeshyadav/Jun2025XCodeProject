//
//  NewsViewmodel.swift
//  June23
//
//  Created by Lokesh Yadav on 24/06/25.
//

import Foundation
import UIKit

final class NewsViewModel {
    private let networkService: Networking
    private(set) var allArticles: [Article] = []
    
    // Dependency injection through initializer
    init(networkService: Networking) {
        self.networkService = networkService
    }
    var onUpdate:(() -> ())?
    var onError:((String) -> ())?
    
    func loadNews() {
        networkService.fetchData(from: APIEndPoint.urlStr) {[weak self] (result:Result<ArticlesResponse, NetworkError>) in
            switch result {
            case .success(let list):
                self?.allArticles = list.articles
                self?.onUpdate?()
            case .failure(let err):
                self?.onError?(err.userMessge)
            }
        }
    }

   
    func loadImage(from strUrl: String, completion:@escaping(UIImage) -> ()){
        networkService.fetchImageData(from: strUrl) { result in
            switch result {
            case .success(let img):
                completion(img)
            case .failure:
                completion(UIImage(systemName: "x.circle")!)
            }
        }
    }

    
}
